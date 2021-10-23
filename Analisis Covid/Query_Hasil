/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

Select *
From Skrip..Covid_Data
Where continent is not null 
order by 3,4


-- Select Data that we are going to be starting with

Select Location, date, total_cases, new_cases, total_deaths, population
From Skrip..Covid_Data
Where continent is not null 
order by 1,2


-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

Select Location, date, CONVERT(DECIMAL(15,1),total_cases),CONVERT(DECIMAL(15,1),total_deaths), 
(CONVERT(DECIMAL(15,1),total_deaths)/CONVERT(DECIMAL(15,1),total_cases))*100 as DeathPercentage
From Skrip..Covid_Data
Where location like '%states%'
and continent is not null 
order by 1,2


-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

Select Location, date, CONVERT(DECIMAL(15,1),Population), CONVERT(DECIMAL(15,1),total_cases),
(CONVERT(DECIMAL(15,1),total_cases)/CONVERT(DECIMAL(15,1),population))*100 as PercentPopulationInfected
From Skrip..Covid_Data
--Where location like '%states%'
order by 1,2


-- Countries with Highest Infection Rate compared to Population

Select Location, CONVERT(DECIMAL(15,1),Population), MAX(total_cases) as HighestInfectionCount,  
Max((CONVERT(DECIMAL(15,1),total_cases)/CONVERT(DECIMAL(15,1),population)))*100 as PercentPopulationInfected
From Skrip..Covid_Data
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population

Select Location, MAX(Total_deaths) as TotalDeathCount
From Skrip..Covid_Data
--Where location like '%states%'
Where continent is not null 
Group by Location
order by TotalDeathCount desc



-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select continent, MAX(Total_deaths) as TotalDeathCount
From Skrip..Covid_Data
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc



-- GLOBAL NUMBERS

Select SUM(CONVERT(DECIMAL(15,1),new_cases)) as total_cases, SUM(CONVERT(DECIMAL(15,1),new_deaths)) as total_deaths, 
(SUM(CONVERT(DECIMAL(15,1),new_deaths))/SUM(CONVERT(DECIMAL(15,1),New_Cases)))*100 as DeathPercentage
From Skrip..Covid_Data
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

--LOOKING AT TOTAL POPULATION VS Vaccinations
SELECT dea.continent, dea.location, dea.population, vac.new_vaccinations 
, SUM(CONVERT(DECIMAL(15,1),vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.Date) AS RollingPeopleVaccinated
FROM 
Skrip..Covid_Data dea
JOIN Skrip..CovidVac vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is NOT NULL
ORDER BY 2,3

-- USING CTE TO PERFORM Calculation On Partition By In Previous Query
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations 
, SUM(CONVERT(DECIMAL(15,1),vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.Date) AS RollingPeopleVaccinated
FROM 
Skrip..Covid_Data dea
JOIN Skrip..CovidVac vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is NOT NULL
)
SELECT *, (RollingPeopleVaccinated/Population)*100
FROM PopvsVac


-- Using Temp Table to perform Calculation on Partition By in previous query
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations 
, SUM(CONVERT(DECIMAL(15,1),vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.Date) AS RollingPeopleVaccinated
FROM 
Skrip..Covid_Data dea
JOIN Skrip..CovidVac vac
	ON dea.location = vac.location
	AND dea.date = vac.date
--WHERE dea.continent is NOT NULL

SELECT *, (RollingPeopleVaccinated/Population)*100
FROM #PercentPopulationVaccinated



-- CREATE VIEW
DROP VIEW IF EXISTS PercentPopulationVaccinated ;
USE Skrip ;
GO
CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations 
, SUM(CONVERT(DECIMAL(15,1),vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.Date) AS RollingPeopleVaccinated
FROM 
Skrip..Covid_Data dea
JOIN Skrip..CovidVac vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is NOT NULL

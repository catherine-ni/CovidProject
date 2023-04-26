
--Using Covid data from 2020 Jan to 2021 Apr

--Death Rate of Covid in Japan AKA Likelyhood of dying if you get covid in Japan

select location, max(total_cases) as TotalCases, max(total_cases) as TotalCases, max(total_deaths)/max(total_cases)*100 as DeathRate
from PortfolioProgect.dbo.CovidDeaths
where continent is not null and location ='japan'
group by location

--Infection Rate of Covid in Japan

select location, max(total_cases) as TotalCases, max(total_cases)/population*100 as InfectionRate
from PortfolioProgect.dbo.CovidDeaths
where continent is not null and location ='japan'
group by location, population

--Countries with Highest Infection Rate that have Population of more than 100,000,000

select location, population, max(total_cases) as TotalCases, max(total_cases)/population*100 as InfectionRate
from PortfolioProgect.dbo.CovidDeaths
where continent is not null and population > 100000000
group by location, population
order by InfectionRate desc

--Countries with Highest Death Rate that have Population of more than 100,000,000

select location, population, max(total_cases) as TotalCases, max(total_deaths) as TotalDeaths, max(total_Deaths)/max(Total_cases)*100 as DeathRate
from PortfolioProgect..CovidDeaths
where continent is not null and population > 100000000
group by location, population
order by DeathRate desc

--Continent with Highest Deaths 

select location, sum(population) as Population, MAX(cast(Total_deaths as int)) as TotalDeaths
from PortfolioProgect..CovidDeaths
where continent is null
group by location
order by TotalDeaths desc
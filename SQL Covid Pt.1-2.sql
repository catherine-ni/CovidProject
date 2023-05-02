
--Join tables 
--Show the new daily vaccinations and total vaccinations in Japan

select dea.location, dea.date, population, vac.new_vaccinations as 'Daily total vaccinations', 
sum(cast(vac.new_vaccinations as int)) 
over (partition by dea.location order by dea.date, dea.location) as TotalVaccination
from PortfolioProgect..CovidDeaths as dea
join PortfolioProgect..CovidVaccinations as vac
on dea.location = vac.location
and dea.date = vac.date
where vac.continent is not null and dea.location = 'japan' and vac.new_vaccinations is not null
order by date

--**NOT DONE YET**
--Using CTE to use the Particion By (new 'TotalVaccination' colum) for calculation
--Show the the percentage of people vaccinated in Japan 

With Japan (location, date, population, new_vaccinations, TotalVaccination)
as 
(
select dea.location, dea.date, population, vac.new_vaccinations, 
sum(cast(vac.new_vaccinations as int)) 
over (partition by dea.location order by dea.date, dea.location) as TotalVaccination
from PortfolioProgect..CovidDeaths as dea
join PortfolioProgect..CovidVaccinations as vac
on dea.location = vac.location
and dea.date = vac.date
where vac.continent is not null and dea.location = 'japan' and vac.new_vaccinations is not null
)
select location, date, (totalvaccination/vac.new_vaccinations)*100
from Japan
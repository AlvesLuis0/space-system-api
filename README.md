![project banner](.images/banner.jpg)

<h1 align="center" style="font-weight: bold;">
  Space System API 🚀
</h1>

<p align="center">
  <a href="#description">Description</a> •
  <a href="#technologies">Technologies</a> •
  <a href="#starting">Starting</a> •
  <a href="#routes">API Routes</a> •
</p>

<p align="center">
  <b>A system to manage the registration of space expedition missions</b>
</p>

<h2 id="description">📜 Description</h2>

The purpose of the project is to build a space expedition management system to facilitate
the planning, monitoring and execution of space missions, from the launch until return

<h2 id="technologies">💻 Technologies</h2>

- Ruby on Rails
- Postgresql

<h2 id="starting">🏁 Starting</h2>

<h3>Prerequisites</h3>

- [Git](https://git-scm.com)
- [Ruby](https://www.ruby-lang.org/en/)
- [Postgresql](https://www.postgresql.org/)
- [Bundler](https://bundler.io/)

<h3>Cloning</h3>

```bash
git clone https://github.com/alvesluis0/space-system-api
```

<h3>Starting</h3>

How to start your project

```bash
cd space-system-api
bundler install
rails db:create
rails db:migrate
rails server
```

<h2 id="routes">📍 API Routes</h2>

| route                           | description                                     |
| ------------------------------- | ----------------------------------------------- |
| **MISSION**                     | ---                                             |
| <kbd>GET /missions</kbd>        | get all missions - [see more](#mission-details) |
| <kbd>GET /missions/:id</kbd>    | get a mission - [see more](#mission-details)    |
| <kbd>POST /missions</kbd>       | create mission - [see more](#mission-details)   |
| <kbd>PUT /missions/:id</kbd>    | update a mission - [see more](#mission-details) |
| <kbd>DELETE /missions/:id</kbd> | delete a mission                                |

<h3 id="mission-details">MISSION</h3>

<h4>Notes:</h4>

- **Launch date** must follow the format _yyyy-mm-dd_
- The **status** field must be equal to _ACTIVE_, _ABORTED_ or _COMPLETED_
- The **cost** field must be a _integer_ or _decimal_

**REQUEST**

The request body is only required in the _POST_ and _PUT_ methods in the following format:

```json
{
  "name": "Apollo 11",
  "launch_date": "1969-07-16",
  "destination": "Moon",
  "status": "COMPLETED",
  "crew": "Neil Armstrong, Michael Collins, Buzz Aldrin",
  "duration_in_days": 8,
  "cost": 702300000000,
  "details": "Armstrong and Aldrin collected 47.5 pounds (21.5 kg) of lunar material to bring back to Earth as pilot Michael Collins flew the Command Module Columbia in lunar orbit, and were on the Moon's surface for 21 hours, 36 minutes before lifting off to rejoin Columbia."
}
```

**RESPONSE**

The response body in the _GET_, _POST_ and _PUT_ methods is in the following format:

```json
{
  "id": 1,
  "name": "Apollo 11",
  "launch_date": "1969-07-16",
  "destination": "Moon",
  "status": "COMPLETED",
  "crew": "Neil Armstrong, Michael Collins, Buzz Aldrin",
  "duration_in_days": 8,
  "cost": "702300000000.0",
  "details": "Armstrong and Aldrin collected 47.5 pounds (21.5 kg) of lunar material to bring back to Earth as pilot Michael Collins flew the Command Module Columbia in lunar orbit, and were on the Moon's surface for 21 hours, 36 minutes before lifting off to rejoin Columbia.",
  "created_at": "2024-06-13T18:28:17.901Z",
  "updated_at": "2024-06-13T18:28:17.901Z"
}
```

In the _GET_ request to search for **all missions** in descending order of date launch,
the answer will be summarized, showing only the most important attributes, in addition
to being able to filter the missions that were launched between a start date and a date
end by URL as follows: `/missions?start_date=1900-01-01&end_date=1999-12-31`

```json
[
  {
    "id": 1,
    "name": "Apollo 11",
    "launch_date": "1969-07-16",
    "destination": "Moon",
    "status": "COMPLETED"
  }
]
```

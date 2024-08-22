json.draw @draw
json.data @asteroids
json.recordsTotal Asteroid.count
json.recordsFiltered @asteroids.total_entries

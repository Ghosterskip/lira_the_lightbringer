components {
  id: "light_projectile"
  component: "/game/combat/light_projectile.script"
  properties {
    id: "direction"
    value: "1.0, 0.0, 0.0"
    type: PROPERTY_TYPE_VECTOR3
  }
}
embedded_components {
  id: "projectile_skin"
  type: "sprite"
  data: "default_animation: \"Circle\"\n"
  "material: \"/assets/materials/lit_sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/atlas/lira.atlas\"\n"
  "}\n"
  ""
  position {
    z: -20.0
  }
  scale {
    x: 0.1
    y: 0.1
  }
}
embedded_components {
  id: "projectile_collision_object"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"player_projectile\"\n"
  "mask: \"enemy\"\n"
  "mask: \"ground\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_SPHERE\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 1\n"
  "  }\n"
  "  data: 22.5\n"
  "}\n"
  ""
}
embedded_components {
  id: "point_light"
  type: "point_light"
  data: "data {\n"
  "  struct {\n"
  "    fields {\n"
  "      key: \"color\"\n"
  "      value {\n"
  "        list {\n"
  "          values {\n"
  "            number: 0.7411764860153198\n"
  "          }\n"
  "          values {\n"
  "            number: 0.7333333492279053\n"
  "          }\n"
  "          values {\n"
  "            number: 0.6823529601097107\n"
  "          }\n"
  "        }\n"
  "      }\n"
  "    }\n"
  "    fields {\n"
  "      key: \"intensity\"\n"
  "      value {\n"
  "        number: 20.0\n"
  "      }\n"
  "    }\n"
  "    fields {\n"
  "      key: \"range\"\n"
  "      value {\n"
  "        number: 300.0\n"
  "      }\n"
  "    }\n"
  "  }\n"
  "}\n"
  ""
}
embedded_components {
  id: "impact_factory"
  type: "factory"
  data: "prototype: \"/game/combat/projectile_impact.go\"\n"
  ""
}

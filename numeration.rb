require "awesome_print"

records = [
  { id: 1, title: "heading1", heading_level: 0 },
  { id: 2, title: "heading2", heading_level: 3 },
  { id: 3, title: "heading3", heading_level: 4 },
  { id: 4, title: "heading4", heading_level: 1 },
  { id: 5, title: "heading5", heading_level: 0 },
  { id: 1, title: "heading1", heading_level: 0 },
  { id: 2, title: "heading2", heading_level: 3 },
  { id: 3, title: "heading3", heading_level: 4 },
  { id: 4, title: "heading4", heading_level: 1 },
  { id: 5, title: "heading5", heading_level: 0 }
]

def add_numeration(recs)
  @memo = []
  out = []
  recs.each do |r|
    numeration = ""
    (0..r[:heading_level]).each do |i|
      @memo[i] = find_level_number(out, i, r[:heading_level])
    end
    (0..r[:heading_level]).each do |i|
      numeration.concat(@memo[i].to_s, ".")
    end
    r[:numeration] = numeration
    out << r
  end
  ap out
  return out
end

def find_level_number(recs, level, inc_level)
  if recs.empty?
    return 1 # we start with 1.
  elsif @memo[level].nil?
    return 1 # if we dont have higher level then we want to set it as 1 (we don't want 1.0.1)
  elsif recs.last[:heading_level] < level
    return 1 # if last heading_level was higher then we start from 1 again.
  elsif
    l = @memo[level]
  end
  level == inc_level ? l + 1 : l
end

add_numeration(records)

SELECT i.Name AS Item, i.Price, i.MinLevel, gt.Name AS [Forbidden Game Type]
FROM Items i
LEFT JOIN GameTypeForbiddenItems fi
ON fi.ItemId = i.Id
LEFT JOIN GameTypes gt
ON gt.Id = fi.GameTypeId
ORDER BY gt.Name DESC, i.Name
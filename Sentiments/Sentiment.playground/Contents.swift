import CreateML

if #available(OSX 10.14, *) {
    let data = try! MLDataTable(contentsOf: URL(fileURLWithPath: "sentiments.csv"))
    let (trainingData, _) = data.randomSplit(by: 0.8, seed: 5)
    let sentimentClassifier = try MLTextClassifier(trainingData: trainingData,
                                                   textColumn: "text",
                                                   labelColumn: "label")

    let metadata = MLModelMetadata(author: "Roy Marmelstein",
                                   shortDescription: "A sentiment analysis model",
                                   version: "1.0")

    try sentimentClassifier.write(to: URL(fileURLWithPath: "SentimentClassifer.mlmodel"),
                                  metadata: metadata)
} else {
    // Fallback on earlier versions
}

// THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT.
/**
The MIT License (MIT)

Copyright (c) 2017 Yuki Takei(noppoMan)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

import Foundation
import Core

extension Cloudsearchdomain {

    public struct Bucket: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The facet value being counted.
        public let value: String?
        /// The number of hits that contain the facet value in the specified facet field.
        public let count: Int64?

        public init(value: String? = nil, count: Int64? = nil) {
            self.value = value
            self.count = count
        }

        public init(dictionary: [String: Any]) throws {
            self.value = dictionary["value"] as? String
            self.count = dictionary["count"] as? Int64
        }
    }

    public struct SuggestResponse: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The status of a SuggestRequest. Contains the resource ID (rid) and how long it took to process the request (timems).
        public let status: SuggestStatus?
        /// Container for the matching search suggestion information.
        public let suggest: SuggestModel?

        public init(status: SuggestStatus? = nil, suggest: SuggestModel? = nil) {
            self.status = status
            self.suggest = suggest
        }

        public init(dictionary: [String: Any]) throws {
            if let status = dictionary["status"] as? [String: Any] { self.status = try Cloudsearchdomain.SuggestStatus(dictionary: status) } else { self.status = nil }
            if let suggest = dictionary["suggest"] as? [String: Any] { self.suggest = try Cloudsearchdomain.SuggestModel(dictionary: suggest) } else { self.suggest = nil }
        }
    }

    public struct FieldStats: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The standard deviation of the values in the specified field in the result set.
        public let stddev: Double?
        /// The maximum value found in the specified field in the result set. If the field is numeric (int, int-array, double, or double-array), max is the string representation of a double-precision 64-bit floating point value. If the field is date or date-array, max is the string representation of a date with the format specified in IETF RFC3339: yyyy-mm-ddTHH:mm:ss.SSSZ.
        public let max: String?
        /// The number of documents that contain a value in the specified field in the result set.
        public let count: Int64?
        /// The minimum value found in the specified field in the result set. If the field is numeric (int, int-array, double, or double-array), min is the string representation of a double-precision 64-bit floating point value. If the field is date or date-array, min is the string representation of a date with the format specified in IETF RFC3339: yyyy-mm-ddTHH:mm:ss.SSSZ.
        public let min: String?
        /// The number of documents that do not contain a value in the specified field in the result set.
        public let missing: Int64?
        /// The sum of all field values in the result set squared.
        public let sumOfSquares: Double?
        /// The sum of the field values across the documents in the result set. null for date fields.
        public let sum: Double?
        /// The average of the values found in the specified field in the result set. If the field is numeric (int, int-array, double, or double-array), mean is the string representation of a double-precision 64-bit floating point value. If the field is date or date-array, mean is the string representation of a date with the format specified in IETF RFC3339: yyyy-mm-ddTHH:mm:ss.SSSZ.
        public let mean: String?

        public init(stddev: Double? = nil, max: String? = nil, count: Int64? = nil, min: String? = nil, missing: Int64? = nil, sumOfSquares: Double? = nil, sum: Double? = nil, mean: String? = nil) {
            self.stddev = stddev
            self.max = max
            self.count = count
            self.min = min
            self.missing = missing
            self.sumOfSquares = sumOfSquares
            self.sum = sum
            self.mean = mean
        }

        public init(dictionary: [String: Any]) throws {
            self.stddev = dictionary["stddev"] as? Double
            self.max = dictionary["max"] as? String
            self.count = dictionary["count"] as? Int64
            self.min = dictionary["min"] as? String
            self.missing = dictionary["missing"] as? Int64
            self.sumOfSquares = dictionary["sumOfSquares"] as? Double
            self.sum = dictionary["sum"] as? Double
            self.mean = dictionary["mean"] as? String
        }
    }

    public struct SearchStatus: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The encrypted resource ID for the request.
        public let rid: String?
        /// How long it took to process the request, in milliseconds.
        public let timems: Int64?

        public init(rid: String? = nil, timems: Int64? = nil) {
            self.rid = rid
            self.timems = timems
        }

        public init(dictionary: [String: Any]) throws {
            self.rid = dictionary["rid"] as? String
            self.timems = dictionary["timems"] as? Int64
        }
    }

    public struct SearchResponse: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The documents that match the search criteria.
        public let hits: Hits?
        /// The status information returned for the search request.
        public let status: SearchStatus?
        /// The requested field statistics information.
        public let stats: [String: FieldStats]?
        /// The requested facet information.
        public let facets: [String: BucketInfo]?

        public init(hits: Hits? = nil, status: SearchStatus? = nil, stats: [String: FieldStats]? = nil, facets: [String: BucketInfo]? = nil) {
            self.hits = hits
            self.status = status
            self.stats = stats
            self.facets = facets
        }

        public init(dictionary: [String: Any]) throws {
            if let hits = dictionary["hits"] as? [String: Any] { self.hits = try Cloudsearchdomain.Hits(dictionary: hits) } else { self.hits = nil }
            if let status = dictionary["status"] as? [String: Any] { self.status = try Cloudsearchdomain.SearchStatus(dictionary: status) } else { self.status = nil }
            if let stats = dictionary["stats"] as? [String: Any] {
                var statsDict: [String: FieldStats] = [:]
                for (key, value) in stats {
                    guard let fieldStatsDict = value as? [String: Any] else { throw InitializableError.convertingError }
                    statsDict[key] = try FieldStats(dictionary: fieldStatsDict)
                }
                self.stats = statsDict
            } else { 
                self.stats = nil
            }
            if let facets = dictionary["facets"] as? [String: Any] {
                var facetsDict: [String: BucketInfo] = [:]
                for (key, value) in facets {
                    guard let bucketInfoDict = value as? [String: Any] else { throw InitializableError.convertingError }
                    facetsDict[key] = try BucketInfo(dictionary: bucketInfoDict)
                }
                self.facets = facetsDict
            } else { 
                self.facets = nil
            }
        }
    }

    public struct SuggestRequest: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        public static var queryParams: [String: String] {
            return ["suggester": "suggester", "size": "size", "q": "query"]
        }
        /// Specifies the name of the suggester to use to find suggested matches.
        public let suggester: String
        /// Specifies the maximum number of suggestions to return. 
        public let size: Int64?
        /// Specifies the string for which you want to get suggestions.
        public let query: String

        public init(suggester: String, size: Int64? = nil, query: String) {
            self.suggester = suggester
            self.size = size
            self.query = query
        }

        public init(dictionary: [String: Any]) throws {
            guard let suggester = dictionary["Suggester"] as? String else { throw InitializableError.missingRequiredParam("Suggester") }
            self.suggester = suggester
            self.size = dictionary["Size"] as? Int64
            guard let query = dictionary["Q"] as? String else { throw InitializableError.missingRequiredParam("Q") }
            self.query = query
        }
    }

    public struct SuggestModel: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The documents that match the query string.
        public let suggestions: [SuggestionMatch]?
        /// The number of documents that were found to match the query string.
        public let found: Int64?
        /// The query string specified in the suggest request.
        public let query: String?

        public init(suggestions: [SuggestionMatch]? = nil, found: Int64? = nil, query: String? = nil) {
            self.suggestions = suggestions
            self.found = found
            self.query = query
        }

        public init(dictionary: [String: Any]) throws {
            if let suggestions = dictionary["suggestions"] as? [[String: Any]] {
                self.suggestions = try suggestions.map({ try SuggestionMatch(dictionary: $0) })
            } else { 
                self.suggestions = nil
            }
            self.found = dictionary["found"] as? Int64
            self.query = dictionary["query"] as? String
        }
    }

    public struct DocumentServiceWarning: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The description for a warning returned by the document service.
        public let message: String?

        public init(message: String? = nil) {
            self.message = message
        }

        public init(dictionary: [String: Any]) throws {
            self.message = dictionary["message"] as? String
        }
    }

    public struct Hits: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// A document that matches the search request.
        public let hit: [Hit]?
        /// A cursor that can be used to retrieve the next set of matching documents when you want to page through a large result set.
        public let cursor: String?
        /// The index of the first matching document.
        public let start: Int64?
        /// The total number of documents that match the search request.
        public let found: Int64?

        public init(hit: [Hit]? = nil, cursor: String? = nil, start: Int64? = nil, found: Int64? = nil) {
            self.hit = hit
            self.cursor = cursor
            self.start = start
            self.found = found
        }

        public init(dictionary: [String: Any]) throws {
            if let hit = dictionary["hit"] as? [[String: Any]] {
                self.hit = try hit.map({ try Hit(dictionary: $0) })
            } else { 
                self.hit = nil
            }
            self.cursor = dictionary["cursor"] as? String
            self.start = dictionary["start"] as? Int64
            self.found = dictionary["found"] as? Int64
        }
    }

    public struct SuggestionMatch: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The document ID of the suggested document.
        public let id: String?
        /// The relevance score of a suggested match.
        public let score: Int64?
        /// The string that matches the query string specified in the SuggestRequest. 
        public let suggestion: String?

        public init(id: String? = nil, score: Int64? = nil, suggestion: String? = nil) {
            self.id = id
            self.score = score
            self.suggestion = suggestion
        }

        public init(dictionary: [String: Any]) throws {
            self.id = dictionary["id"] as? String
            self.score = dictionary["score"] as? Int64
            self.suggestion = dictionary["suggestion"] as? String
        }
    }

    public struct UploadDocumentsRequest: AWSShape {
        /// The key for the payload
        public static let payload: String? = "documents"
        public static var headerParams: [String: String] {
            return ["Content-Type": "contentType"]
        }
        /// A batch of documents formatted in JSON or HTML.
        public let documents: Data
        /// The format of the batch you are uploading. Amazon CloudSearch supports two document batch formats:  application/json application/xml 
        public let contentType: String

        public init(documents: Data, contentType: String) {
            self.documents = documents
            self.contentType = contentType
        }

        public init(dictionary: [String: Any]) throws {
            guard let documents = dictionary["documents"] as? Data else { throw InitializableError.missingRequiredParam("documents") }
            self.documents = documents
            guard let contentType = dictionary["Content-Type"] as? String else { throw InitializableError.missingRequiredParam("Content-Type") }
            self.contentType = contentType
        }
    }

    public struct BucketInfo: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// A list of the calculated facet values and counts.
        public let buckets: [Bucket]?

        public init(buckets: [Bucket]? = nil) {
            self.buckets = buckets
        }

        public init(dictionary: [String: Any]) throws {
            if let buckets = dictionary["buckets"] as? [[String: Any]] {
                self.buckets = try buckets.map({ try Bucket(dictionary: $0) })
            } else { 
                self.buckets = nil
            }
        }
    }

    public struct SuggestStatus: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The encrypted resource ID for the request.
        public let rid: String?
        /// How long it took to process the request, in milliseconds.
        public let timems: Int64?

        public init(rid: String? = nil, timems: Int64? = nil) {
            self.rid = rid
            self.timems = timems
        }

        public init(dictionary: [String: Any]) throws {
            self.rid = dictionary["rid"] as? String
            self.timems = dictionary["timems"] as? Int64
        }
    }

    public struct Hit: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The fields returned from a document that matches the search request.
        public let fields: [String: [String]]?
        /// The document ID of a document that matches the search request.
        public let id: String?
        /// The expressions returned from a document that matches the search request.
        public let exprs: [String: String]?
        /// The highlights returned from a document that matches the search request.
        public let highlights: [String: String]?

        public init(fields: [String: [String]]? = nil, id: String? = nil, exprs: [String: String]? = nil, highlights: [String: String]? = nil) {
            self.fields = fields
            self.id = id
            self.exprs = exprs
            self.highlights = highlights
        }

        public init(dictionary: [String: Any]) throws {
            if let fields = dictionary["fields"] as? [String: Any] {
                var fieldsDict: [String: [String]] = [:]
                for (key, value) in fields {
                    guard let fieldValue = value as? [String] else { throw InitializableError.convertingError }
                    fieldsDict[key] = fieldValue
                }
                self.fields = fieldsDict
            } else { 
                self.fields = nil
            }
            self.id = dictionary["id"] as? String
            if let exprs = dictionary["exprs"] as? [String: String] {
                self.exprs = exprs
            } else { 
                self.exprs = nil
            }
            if let highlights = dictionary["highlights"] as? [String: String] {
                self.highlights = highlights
            } else { 
                self.highlights = nil
            }
        }
    }

    public struct SearchRequest: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        public static var queryParams: [String: String] {
            return ["sort": "sort", "expr": "expr", "size": "size", "highlight": "highlight", "q.options": "queryOptions", "q": "query", "start": "start", "stats": "stats", "facet": "facet", "fq": "filterQuery", "return": "return", "partial": "partial", "cursor": "cursor", "q.parser": "queryParser"]
        }
        /// Specifies the fields or custom expressions to use to sort the search results. Multiple fields or expressions are specified as a comma-separated list. You must specify the sort direction (asc or desc) for each field; for example, year desc,title asc. To use a field to sort results, the field must be sort-enabled in the domain configuration. Array type fields cannot be used for sorting. If no sort parameter is specified, results are sorted by their default relevance scores in descending order: _score desc. You can also sort by document ID (_id asc) and version (_version desc). For more information, see Sorting Results in the Amazon CloudSearch Developer Guide.
        public let sort: String?
        /// Defines one or more numeric expressions that can be used to sort results or specify search or filter criteria. You can also specify expressions as return fields.  You specify the expressions in JSON using the form {"EXPRESSIONNAME":"EXPRESSION"}. You can define and use multiple expressions in a search request. For example:  {"expression1":"_score*rating", "expression2":"(1/rank)*year"}   For information about the variables, operators, and functions you can use in expressions, see Writing Expressions in the Amazon CloudSearch Developer Guide.
        public let expr: String?
        /// Specifies the maximum number of search hits to include in the response. 
        public let size: Int64?
        /// Retrieves highlights for matches in the specified text or text-array fields. Each specified field must be highlight enabled in the domain configuration. The fields and options are specified in JSON using the form {"FIELD":{"OPTION":VALUE,"OPTION:"STRING"},"FIELD":{"OPTION":VALUE,"OPTION":"STRING"}}. You can specify the following highlight options:   format: specifies the format of the data in the text field: text or html. When data is returned as HTML, all non-alphanumeric characters are encoded. The default is html.   max_phrases: specifies the maximum number of occurrences of the search term(s) you want to highlight. By default, the first occurrence is highlighted.   pre_tag: specifies the string to prepend to an occurrence of a search term. The default for HTML highlights is &amp;lt;em&amp;gt;. The default for text highlights is *.   post_tag: specifies the string to append to an occurrence of a search term. The default for HTML highlights is &amp;lt;/em&amp;gt;. The default for text highlights is *.   If no highlight options are specified for a field, the returned field text is treated as HTML and the first match is highlighted with emphasis tags: &amp;lt;em&gt;search-term&amp;lt;/em&amp;gt;. For example, the following request retrieves highlights for the actors and title fields.  { "actors": {}, "title": {"format": "text","max_phrases": 2,"pre_tag": "","post_tag": ""} }
        public let highlight: String?
        /// Specifies the search criteria for the request. How you specify the search criteria depends on the query parser used for the request and the parser options specified in the queryOptions parameter. By default, the simple query parser is used to process requests. To use the structured, lucene, or dismax query parser, you must also specify the queryParser parameter.  For more information about specifying search criteria, see Searching Your Data in the Amazon CloudSearch Developer Guide.
        public let query: String
        /// Specifies the offset of the first search hit you want to return. Note that the result set is zero-based; the first result is at index 0. You can specify either the start or cursor parameter in a request, they are mutually exclusive.  For more information, see Paginating Results in the Amazon CloudSearch Developer Guide.
        public let start: Int64?
        /// Specifies one or more fields for which to get statistics information. Each specified field must be facet-enabled in the domain configuration. The fields are specified in JSON using the form: {"FIELD-A":{},"FIELD-B":{}} There are currently no options supported for statistics.
        public let stats: String?
        /// Specifies which query parser to use to process the request. If queryParser is not specified, Amazon CloudSearch uses the simple query parser.  Amazon CloudSearch supports four query parsers:   simple: perform simple searches of text and text-array fields. By default, the simple query parser searches all text and text-array fields. You can specify which fields to search by with the queryOptions parameter. If you prefix a search term with a plus sign (+) documents must contain the term to be considered a match. (This is the default, unless you configure the default operator with the queryOptions parameter.) You can use the - (NOT), | (OR), and * (wildcard) operators to exclude particular terms, find results that match any of the specified terms, or search for a prefix. To search for a phrase rather than individual terms, enclose the phrase in double quotes. For more information, see Searching for Text in the Amazon CloudSearch Developer Guide.   structured: perform advanced searches by combining multiple expressions to define the search criteria. You can also search within particular fields, search for values and ranges of values, and use advanced options such as term boosting, matchall, and near. For more information, see Constructing Compound Queries in the Amazon CloudSearch Developer Guide.   lucene: search using the Apache Lucene query parser syntax. For more information, see Apache Lucene Query Parser Syntax.   dismax: search using the simplified subset of the Apache Lucene query parser syntax defined by the DisMax query parser. For more information, see DisMax Query Parser Syntax.  
        public let queryParser: String?
        /// Specifies one or more fields for which to get facet information, and options that control how the facet information is returned. Each specified field must be facet-enabled in the domain configuration. The fields and options are specified in JSON using the form {"FIELD":{"OPTION":VALUE,"OPTION:"STRING"},"FIELD":{"OPTION":VALUE,"OPTION":"STRING"}}. You can specify the following faceting options:   buckets specifies an array of the facet values or ranges to count. Ranges are specified using the same syntax that you use to search for a range of values. For more information, see  Searching for a Range of Values in the Amazon CloudSearch Developer Guide. Buckets are returned in the order they are specified in the request. The sort and size options are not valid if you specify buckets.   size specifies the maximum number of facets to include in the results. By default, Amazon CloudSearch returns counts for the top 10. The size parameter is only valid when you specify the sort option; it cannot be used in conjunction with buckets.   sort specifies how you want to sort the facets in the results: bucket or count. Specify bucket to sort alphabetically or numerically by facet value (in ascending order). Specify count to sort by the facet counts computed for each facet value (in descending order). To retrieve facet counts for particular values or ranges of values, use the buckets option instead of sort.    If no facet options are specified, facet counts are computed for all field values, the facets are sorted by facet count, and the top 10 facets are returned in the results. To count particular buckets of values, use the buckets option. For example, the following request uses the buckets option to calculate and return facet counts by decade.  {"year":{"buckets":["[1970,1979]","[1980,1989]","[1990,1999]","[2000,2009]","[2010,}"]}}  To sort facets by facet count, use the count option. For example, the following request sets the sort option to count to sort the facet values by facet count, with the facet values that have the most matching documents listed first. Setting the size option to 3 returns only the top three facet values.  {"year":{"sort":"count","size":3}}  To sort the facets by value, use the bucket option. For example, the following request sets the sort option to bucket to sort the facet values numerically by year, with earliest year listed first.   {"year":{"sort":"bucket"}}  For more information, see Getting and Using Facet Information in the Amazon CloudSearch Developer Guide.
        public let facet: String?
        /// Specifies a structured query that filters the results of a search without affecting how the results are scored and sorted. You use filterQuery in conjunction with the query parameter to filter the documents that match the constraints specified in the query parameter. Specifying a filter controls only which matching documents are included in the results, it has no effect on how they are scored and sorted. The filterQuery parameter supports the full structured query syntax.  For more information about using filters, see Filtering Matching Documents in the Amazon CloudSearch Developer Guide.
        public let filterQuery: String?
        /// Specifies the field and expression values to include in the response. Multiple fields or expressions are specified as a comma-separated list. By default, a search response includes all return enabled fields (_all_fields). To return only the document IDs for the matching documents, specify _no_fields. To retrieve the relevance score calculated for each document, specify _score. 
        public let `return`: String?
        /// Enables partial results to be returned if one or more index partitions are unavailable. When your search index is partitioned across multiple search instances, by default Amazon CloudSearch only returns results if every partition can be queried. This means that the failure of a single search instance can result in 5xx (internal server) errors. When you enable partial results, Amazon CloudSearch returns whatever results are available and includes the percentage of documents searched in the search results (percent-searched). This enables you to more gracefully degrade your users' search experience. For example, rather than displaying no results, you could display the partial results and a message indicating that the results might be incomplete due to a temporary system outage.
        public let partial: Bool?
        /// Retrieves a cursor value you can use to page through large result sets. Use the size parameter to control the number of hits to include in each response. You can specify either the cursor or start parameter in a request; they are mutually exclusive. To get the first cursor, set the cursor value to initial. In subsequent requests, specify the cursor value returned in the hits section of the response.  For more information, see Paginating Results in the Amazon CloudSearch Developer Guide.
        public let cursor: String?
        /// Configures options for the query parser specified in the queryParser parameter. You specify the options in JSON using the following form {"OPTION1":"VALUE1","OPTION2":VALUE2"..."OPTIONN":"VALUEN"}. The options you can configure vary according to which parser you use:  defaultOperator: The default operator used to combine individual terms in the search string. For example: defaultOperator: 'or'. For the dismax parser, you specify a percentage that represents the percentage of terms in the search string (rounded down) that must match, rather than a default operator. A value of 0% is the equivalent to OR, and a value of 100% is equivalent to AND. The percentage must be specified as a value in the range 0-100 followed by the percent (%) symbol. For example, defaultOperator: 50%. Valid values: and, or, a percentage in the range 0%-100% (dismax). Default: and (simple, structured, lucene) or 100 (dismax). Valid for: simple, structured, lucene, and dismax. fields: An array of the fields to search when no fields are specified in a search. If no fields are specified in a search and this option is not specified, all text and text-array fields are searched. You can specify a weight for each field to control the relative importance of each field when Amazon CloudSearch calculates relevance scores. To specify a field weight, append a caret (^) symbol and the weight to the field name. For example, to boost the importance of the title field over the description field you could specify: "fields":["title^5","description"]. Valid values: The name of any configured field and an optional numeric value greater than zero. Default: All text and text-array fields. Valid for: simple, structured, lucene, and dismax. operators: An array of the operators or special characters you want to disable for the simple query parser. If you disable the and, or, or not operators, the corresponding operators (+, |, -) have no special meaning and are dropped from the search string. Similarly, disabling prefix disables the wildcard operator (*) and disabling phrase disables the ability to search for phrases by enclosing phrases in double quotes. Disabling precedence disables the ability to control order of precedence using parentheses. Disabling near disables the ability to use the ~ operator to perform a sloppy phrase search. Disabling the fuzzy operator disables the ability to use the ~ operator to perform a fuzzy search. escape disables the ability to use a backslash (\) to escape special characters within the search string. Disabling whitespace is an advanced option that prevents the parser from tokenizing on whitespace, which can be useful for Vietnamese. (It prevents Vietnamese words from being split incorrectly.) For example, you could disable all operators other than the phrase operator to support just simple term and phrase queries: "operators":["and","not","or", "prefix"]. Valid values: and, escape, fuzzy, near, not, or, phrase, precedence, prefix, whitespace. Default: All operators and special characters are enabled. Valid for: simple. phraseFields: An array of the text or text-array fields you want to use for phrase searches. When the terms in the search string appear in close proximity within a field, the field scores higher. You can specify a weight for each field to boost that score. The phraseSlop option controls how much the matches can deviate from the search string and still be boosted. To specify a field weight, append a caret (^) symbol and the weight to the field name. For example, to boost phrase matches in the title field over the abstract field, you could specify: "phraseFields":["title^3", "plot"] Valid values: The name of any text or text-array field and an optional numeric value greater than zero. Default: No fields. If you don't specify any fields with phraseFields, proximity scoring is disabled even if phraseSlop is specified. Valid for: dismax. phraseSlop: An integer value that specifies how much matches can deviate from the search phrase and still be boosted according to the weights specified in the phraseFields option; for example, phraseSlop: 2. You must also specify phraseFields to enable proximity scoring. Valid values: positive integers. Default: 0. Valid for: dismax. explicitPhraseSlop: An integer value that specifies how much a match can deviate from the search phrase when the phrase is enclosed in double quotes in the search string. (Phrases that exceed this proximity distance are not considered a match.) For example, to specify a slop of three for dismax phrase queries, you would specify "explicitPhraseSlop":3. Valid values: positive integers. Default: 0. Valid for: dismax. tieBreaker: When a term in the search string is found in a document's field, a score is calculated for that field based on how common the word is in that field compared to other documents. If the term occurs in multiple fields within a document, by default only the highest scoring field contributes to the document's overall score. You can specify a tieBreaker value to enable the matches in lower-scoring fields to contribute to the document's score. That way, if two documents have the same max field score for a particular term, the score for the document that has matches in more fields will be higher. The formula for calculating the score with a tieBreaker is (max field score) + (tieBreaker) * (sum of the scores for the rest of the matching fields). Set tieBreaker to 0 to disregard all but the highest scoring field (pure max): "tieBreaker":0. Set to 1 to sum the scores from all fields (pure sum): "tieBreaker":1. Valid values: 0.0 to 1.0. Default: 0.0. Valid for: dismax.  
        public let queryOptions: String?

        public init(sort: String? = nil, expr: String? = nil, size: Int64? = nil, highlight: String? = nil, query: String, start: Int64? = nil, stats: String? = nil, queryParser: String? = nil, facet: String? = nil, filterQuery: String? = nil, return: String? = nil, partial: Bool? = nil, cursor: String? = nil, queryOptions: String? = nil) {
            self.sort = sort
            self.expr = expr
            self.size = size
            self.highlight = highlight
            self.query = query
            self.start = start
            self.stats = stats
            self.queryParser = queryParser
            self.facet = facet
            self.filterQuery = filterQuery
            self.`return` = `return`
            self.partial = partial
            self.cursor = cursor
            self.queryOptions = queryOptions
        }

        public init(dictionary: [String: Any]) throws {
            self.sort = dictionary["Sort"] as? String
            self.expr = dictionary["Expr"] as? String
            self.size = dictionary["Size"] as? Int64
            self.highlight = dictionary["Highlight"] as? String
            guard let query = dictionary["Q"] as? String else { throw InitializableError.missingRequiredParam("Q") }
            self.query = query
            self.start = dictionary["Start"] as? Int64
            self.stats = dictionary["Stats"] as? String
            self.queryParser = dictionary["Q.parser"] as? String
            self.facet = dictionary["Facet"] as? String
            self.filterQuery = dictionary["Fq"] as? String
            self.`return` = dictionary["Return"] as? String
            self.partial = dictionary["Partial"] as? Bool
            self.cursor = dictionary["Cursor"] as? String
            self.queryOptions = dictionary["Q.options"] as? String
        }
    }

    public struct UploadDocumentsResponse: AWSShape {
        /// The key for the payload
        public static let payload: String? = nil
        /// The status of an UploadDocumentsRequest.
        public let status: String?
        /// The number of documents that were deleted from the search domain.
        public let deletes: Int64?
        /// The number of documents that were added to the search domain.
        public let adds: Int64?
        /// Any warnings returned by the document service about the documents being uploaded.
        public let warnings: [DocumentServiceWarning]?

        public init(status: String? = nil, deletes: Int64? = nil, adds: Int64? = nil, warnings: [DocumentServiceWarning]? = nil) {
            self.status = status
            self.deletes = deletes
            self.adds = adds
            self.warnings = warnings
        }

        public init(dictionary: [String: Any]) throws {
            self.status = dictionary["status"] as? String
            self.deletes = dictionary["deletes"] as? Int64
            self.adds = dictionary["adds"] as? Int64
            if let warnings = dictionary["warnings"] as? [[String: Any]] {
                self.warnings = try warnings.map({ try DocumentServiceWarning(dictionary: $0) })
            } else { 
                self.warnings = nil
            }
        }
    }

}
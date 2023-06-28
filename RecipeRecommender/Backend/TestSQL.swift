//
//  TestSQL.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 6/28/23.
//

import Foundation

import PostgresClientKit

import PostgresNIO
import NIOPosix
import Logging

import PostgresKit

class TestSQL: ObservableObject {
    
    func testGetData() async {
        
        do {
            
            let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            let logger = Logger(label: "postgres-logger")
            
            let config = PostgresConnection.Configuration(
                host: "52.45.244.51",
                port: 9753,
                username: "postgres",
                password: ProcessInfo.processInfo.environment["SQL-PASSWORD"],
                database: "postgres",
                tls: .disable
            )
            
            let connection = try await PostgresConnection.connect(
                on: eventLoopGroup.next(),
                configuration: config,
                id: 1,
                logger: logger
            )
            
            let rows = try await connection.query("SELECT * FROM TEST", logger: logger)
            
            for try await (text1, text2, text3) in rows.decode((String, String, String).self) {
                print(text1)
                print(text2)
                print(text3)
                // do something with the datatypes.
            }
            
            // Close your connection once done
            try await connection.close()
            
            // Shutdown the EventLoopGroup, once all connections are closed.
            try await eventLoopGroup.shutdownGracefully()
            
        } catch {
            print(error)
        }
    }
}


    
    
//    func testGetData() {
//
//        let configuration = SQLPostgresConfiguration(
//            hostname: "52.45.244.51",
//            port: 9753,
//            username: "postgres",
//            password: ProcessInfo.processInfo.environment["SQL-PASSWORD"],
//            database: "postgres",
//            tls: .disable
//        )
//
//
//        let eventLoopGroup: EventLoopGroup = ...
//        defer { try! eventLoopGroup.syncShutdown() }
//
//        let pools = EventLoopGroupConnectionPool(
//            source: PostgresConnectionSource(configuration: configuration),
//            on: eventLoopGroup
//        )
//        defer { pools.shutdown() }
//
//    }
    

    
    
    
//    func testGetData() {
//
//        do {
//            print("starting to connect")
//            var configuration = PostgresClientKit.ConnectionConfiguration()
//            configuration.host = "52.45.244.51"
//            configuration.database = "postgres"
//            configuration.user = "postgres"
//            configuration.credential = .scramSHA256(password: ProcessInfo.processInfo.environment["SQL-PASSWORD"]!)
//
//            let connection = try PostgresClientKit.Connection(configuration: configuration)
//            defer { connection.close() }
//
//            let text = "SELECT * FROM TEST;"
//            let statement = try connection.prepareStatement(text: text)
//            defer { statement.close() }
//
//            let cursor = try statement.execute(parameterValues: [ "San Francisco" ])
//            defer { cursor.close() }
//
//            print(cursor)
//
//            //        for row in cursor {
//            //            let columns = try row.get().columns
//            //            let city = try columns[0].string()
//            //            let tempLo = try columns[1].int()
//            //            let tempHi = try columns[2].int()
//            //            let prcp = try columns[3].optionalDouble()
//            //            let date = try columns[4].date()
//            //
//            //            print("""
//            //                \(city) on \(date): low: \(tempLo), high: \(tempHi), \
//            //                precipitation: \(String(describing: prcp))
//            //                """)
//            //        }
//        } catch {
//            print(error) // better error handling goes here
//        }
//    }
    
    
  
    



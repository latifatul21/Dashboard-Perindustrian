
library(readxl)
#setwd("D:/KULIAH/SEMESTER 4/SIM/FP SIM")

library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(tidyverse) 
library(ggplot2)
library(summarytools)
library(readxl)
library(DT)
library(dplyr)
library(shinythemes)
library(bslib)
library(fmsb)
library(esquisse)
library(plotly)
library(dashboardthemes)

###DATA###
jumbs = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 1, col_names = T)
jumbsplot = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 9, col_names = T)
jummk = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 2, col_names = T)
jummkplot = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 12, col_names = T)
tkbs = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 3, col_names = T)
tkbsplot = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 10, col_names = T)
tkmk = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 4, col_names = T)
tkmkplot = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 13, col_names = T)
ntbs = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 5, col_names = T)
ntbsplot = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 11, col_names = T)
ntmk = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 6, col_names = T)
ntmkplot = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 14, col_names = T)
lcbs = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 7, col_names = T)
lcmk = read_xlsx("5003211021_5003211032_Daniel_Latifatul_Perindustrian.xlsx", sheet = 8, col_names = T)

header <- dashboardHeader(title = "Perindustrian RI",
                          titleWidth = 200,
                          dropdownMenu( type = 'message',
                                        icon = icon("envelope"),
                                        messageItem(
                                          from = "Latifatul Khumairoh",
                                          message = "LinkedIn",
                                          icon = icon("linkedin"),
                                          href = "https://www.linkedin.com/in/latifatulkhumairoh"
                                        ),
                                        messageItem(
                                          from = "Ifa",
                                          message = "Instagram",
                                          icon = icon("instagram"),
                                          href = "https://www.instagram.com/im_ifa/"
                                        ),
                                        messageItem(
                                          from = "Daniel Amadeus P.S.",
                                          message = "LinkedIn",
                                          icon = icon("linkedin"),
                                          href = "https://www.linkedin.com/in/danielsaragih/"
                                        ),
                                        messageItem(
                                          from = "Daniel",
                                          message = "Instagram",
                                          icon = icon("instagram"),
                                          href = "https://www.instagram.com/niel_fr/"
                                        )))
sidebar <- dashboardSidebar(
  width = 200,
  sidebarMenu(
    menuItem("Beranda", tabName = "beranda", icon = icon("home")),
    menuItem("Deskripsi", tabName = "deskripsi", icon = icon("book")),
    menuItem("Dataset", tabName = "dataset", icon = icon("database"),
             menuSubItem("Industri Besar dan Sedang", tabName = "databs", icon = icon("arrow-right")),
             menuSubItem("Industri Mikro dan Kecil", tabName = "datamk", icon = icon("arrow-right"))),
    menuItem("Industri Besar dan Sedang", tabName = "bs", icon = icon("industry")),
    menuItem("Industri Mikro dan Kecil", tabName = "mk", icon = icon("shop")),
    menuItem("Penyusun", tabName = "penyusun", icon = icon("person"))
  )
)

body <- dashboardBody(
  shinyDashboardThemes("blue_gradient"),
  tabItems(
    tabItem(tabName = "beranda",
            div(h1(strong("KEMENTERIAN PERINDUSTRIAN RI")),style="text-align: center;"),
            br(),
            div(carousel(width = 9,
                         id = "carouselku",
                         carouselItem(
                           caption = "Menteri Perindustrian RI (Dr. Agus Gumiwang Kartasasmita, M.Si)",
                           tags$img(src = "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/07/14/2393562344.jpg"),
                           active = F,style ="width: 100%; height: auto;"),
                         carouselItem(
                           caption = "Industri besar (Perusahaan rokok PT. Djarum Indonesia)",
                           tags$img(src = "https://mmc.tirto.id/image/otf/1024x535/2016/06/09/TIRTO-antarafoto-tolak-kenaikan-cukai-rokok-261015-yn-1.JPG"),
                           active = F,style ="width: 100%; height: auto;"),
                         carouselItem(
                           caption = "Industri sedang (Usaha konveksi PT. Jaya Abadi Mulia)",
                           tags$img(src = "https://jayaabadimulia.com/wp-content/uploads/2022/02/JAHIT-1-1024x683.jpg"),
                           active = F,style ="width: 100%; height: auto;"),
                         carouselItem(
                           caption = "Industri kecil (Usaha kerajinan keramik Desa Kajigelem)",
                           tags$img(src = "https://carainvestasibisnis.com/wp-content/uploads/2018/03/Usaha-Mikro-1.jpg"),
                           active = F,style ="width: 100%; height: auto;"),
                         carouselItem(
                           caption = "Industri mikro (Usaha rumahan kue)",
                           tags$img(src = "https://cloud.jpnn.com/photo/galeri/watermark/2021/04/27/0D2A7771.JPG"),
                           active = F,style ="width: 100%; height: auto;")
            ))),
    tabItem(tabName = "deskripsi",
            box(title = strong("INDUSTRI SECARA UMUM"),width = 12,solidHeader = T,
                div(strong("Klasifikasi Industri")),"Klasifikasi industri yang digunakan dalam dashboard ini berdasar kepada Klasifikasi Baku Lapangan Usaha Indonesia (KBLI). KBLI adalah klasifikasi lapangan usaha yang berdasar kepada International Standard Industrial Classification of All Economic Activities (ISIC) revisi ke-4 yang telah disesuaikan dengan kondisi Indonesia.",
                br(),br(),
                div(strong("Industri Manufaktur")),"Industri manufaktur adalah suatu kegiatan ekonomi yang melakukan kegiatan mengubah suatu barang dasar secara mekanis, kimia, atau dengan tangan sehingga menjadi barang jadi/setengah jadi, dan atau barang yang kurang nilainya menjadi barang yang lebih tinggi nilainya, dan sifatnya lebih dekat kepada pemakai akhir. Termasuk dalam kegiatan ini adalah jasa industri dan pekerjaan perakitan.",
                br(),br()),
            box(title = strong("PENGELOMPOKAN INDUSTRI MANUFAKTUR"),width = 12,solidHeader = T,
                div(strong("1. Industri Besar")),"Industri besar adalah perusahaan industri manufaktur yang pekerjanya 100 orang atau lebih.",
                br(),
                div(strong("2. Industri Sedang")),"Industri sedang/menangah adalah perusahaan industri manufaktur yang pekerjanya antara 20-99 orang.",
                br(),
                div(strong("3. Industri Kecil")),"Industri kecil adalah perusahaan industri manufaktur yang pekerjanya antara 5-19 orang.",
                br(),
                div(strong("4. Industri Mikro")),"Industri mikro adalah perusahaan industri manufaktur yang pekerjanya antara 1-4 orang.",
                br(),br(),
                div(strong("Pengumpulan data")),"Pengumpulan data industri besar dan sedang dilakukan melalui Survei Industri Besar dan Sedang Tahunan sedangkan pengumpulan data Industri Mikro dan Kecil dilakukan melalui Survei Industri Mikro dan Kecil Tahunan.",
                br(),br())),
    tabItem(tabName = "databs",
            tabsetPanel(tabPanel("Jumlah Perusahaan",
                                 div(h3(strong("Jumlah Perusahaan")),style="text-align: center;"),
                                 div(h4(strong("Industri Besar dan Sedang (unit)")),style="text-align: center;"),
                                 DTOutput("table1")),
                        tabPanel("Jumlah Tenaga Kerja",
                                 div(h3(strong("Jumlah Tenaga Kerja")),style="text-align: center;"),
                                 div(h4(strong("Industri Besar dan Sedang (orang)")),style="text-align: center;"),
                                 DTOutput("table3")),
                        tabPanel("Nilai Tambah (Harga Pasar)",
                                 div(h3(strong("Nilai Tambah (Harga Pasar)")),style="text-align: center;"),
                                 div(h4(strong("Industri Besar dan Sedang (miliar rupiah)")),style="text-align: center;"),
                                 DTOutput("table5")),
                        tabPanel("Labor Cost",
                                 div(h3(strong("Labor Cost")),style="text-align: center;"),
                                 div(h4(strong("Industri Besar dan Sedang (miliar rupiah)")),style="text-align: center;"),
                                 DTOutput("table7")))),
    tabItem(tabName = "datamk",
            tabsetPanel(tabPanel("Jumlah Perusahaan",
                                 div(h3(strong("Jumlah Perusahaan")),style="text-align: center;"),
                                 div(h4(strong("Industri Mikro dan Kecil (unit)")),style="text-align: center;"),
                                 DTOutput("table2")),
                        tabPanel("Jumlah Tenaga Kerja",
                                 div(h3(strong("Jumlah Tenaga Kerja")),style="text-align: center;"),
                                 div(h4(strong("Industri Mikro dan Kecil (orang)")),style="text-align: center;"),
                                 DTOutput("table4")),
                        tabPanel("Nilai Tambah (Harga Pasar)",
                                 div(h3(strong("Nilai Tambah (Harga Pasar)")),style="text-align: center;"),
                                 div(h4(strong("Industri Mikro dan Kecil (miliar rupiah)")),style="text-align: center;"),
                                 DTOutput("table6")),
                        tabPanel("Labor Cost",
                                 div(h3(strong("Labor Cost")),style="text-align: center;"),
                                 div(h4(strong("Industri Mikro dan Kecil (miliar rupiah)")),style="text-align: center;"),
                                 DTOutput("table8")))),
    tabItem(tabName = "bs",
            fluidRow(
              box(title = "Tahun",width = 4,
                  closable = F, collapsible = T,
                  status = "primary",solidHeader = TRUE,
                  selectInput(inputId = "tahun1",label = NULL,
                              choices = c("2017","2018","2019","2020","2021"),
                              selected = "2021"))),
            fluidRow(
              valueBoxOutput("nilaiunitbs", width = 4),
              valueBoxOutput("nilaitkbs", width = 4),
              valueBoxOutput("nilaintbs", width = 4),
              valueBoxOutput("bs1", width = 4),
              valueBoxOutput("bs2", width = 4),
              valueBoxOutput("bs3", width = 4)),
            fluidRow(
              box(title = "Subsektor",width = 6,
                  closable = F, collapsible = T,
                  status = "primary",solidHeader = TRUE,
                  selectInput(inputId = "subsek",label = NULL,
                              choices = unique(jumbs$Subsektor),
                              selected = "Makanan"))),
            fluidRow(
              box(title = "Jumlah Perusahaan IBS Tahun 2017-2021",width = 4,
                  collapsible = T, status = "primary", solidHeader = T,
                  plotlyOutput("jumlahbssek")),
              box(title = "Jumlah Tenaga Kerja IBS Tahun 2017-2021",width = 4,
                  collapsible = T, status = "primary", solidHeader = T,
                  plotlyOutput("tkbssek")),
              box(title = "Nilai Tambah IBS Tahun 2017-2021",width = 4,
                  collapsible = T, status = "primary", solidHeader = T,
                  plotlyOutput("ntbssek")))),
    tabItem(tabName = "mk",
            fluidRow(
              box(title = "Tahun",width = 4,
                  closable = F, collapsible = T,
                  status = "primary",solidHeader = TRUE,
                  selectInput(inputId = "tahun2",label = NULL,
                              choices = c("2017","2018","2019","2020","2021"),
                              selected = "2021"))),
            fluidRow(
              valueBoxOutput("nilaiunitmk", width = 4),
              valueBoxOutput("nilaitkmk", width = 4),
              valueBoxOutput("nilaintmk", width = 4),
              valueBoxOutput("mk1", width = 4),
              valueBoxOutput("mk2", width = 4),
              valueBoxOutput("mk3", width = 4)),
            fluidRow(
              box(title = "Subsektor",width = 6,
                  closable = F, collapsible = T,
                  status = "primary",solidHeader = TRUE,
                  selectInput(inputId = "subsek1",label = NULL,
                              choices = unique(jummk$Subsektor),
                              selected = "Makanan"))),
            fluidRow(
              box(title = "Jumlah Perusahaan IMK Tahun 2017-2021",width = 4,
                  collapsible = T, status = "primary", solidHeader = T,
                  plotlyOutput("jumlahmksek")),
              box(title = "Jumlah Tenaga Kerja IMK Tahun 2017-2021",width = 4,
                  collapsible = T, status = "primary", solidHeader = T,
                  plotlyOutput("tkmksek")),
              box(title = "Nilai Tambah IMK Tahun 2017-2021",width = 4,
                  collapsible = T, status = "primary", solidHeader = T,
                  plotlyOutput("ntmksek")))),
    tabItem(tabName = "penyusun",
            fluidRow(
              box(width = 12,
                  title = div(strong("Anggota Kelompok"),style="text-alig: center;font size: 160%",),
                  div(strong("Kelas Sistem Informasi Manajemen"),style="text-align: center")),
              box(width = 6,
                  status = NULL,
                  div(imageOutput("ifa"),style="text-align: center;",
                      style = "margin-bottom:-180px;"),
                  div(strong("Latifatul Khumairoh"),style="text-align: center;"),
                  div(strong("5003211032"),style="text-align: center;")
              ),
              box(width = 6,
                  status = NULL,
                  div(imageOutput("daniel"),style="text-align: center;",
                      style = "margin-bottom:-180px;"),
                  div(strong("Daniel Amadeus Panal Saragih"),style="text-align: center;"),
                  div(strong("5003211021"),style="text-align: center;")
              )
            )
    )
  ))



ui <- dashboardPage(header = header,
                    sidebar = sidebar,
                    body = body)

server <- function(input,output){
  table1<-reactive((jumbs))
  output$table1 <- renderDT(datatable(table1()),
                            options = list(
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                "}")
                            ))
  table2<-reactive((jummk))
  output$table2 <- renderDT(datatable(table2()),
                            options = list(
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                "}")
                            ))
  table3<-reactive((tkbs))
  output$table3 <- renderDT(datatable(table3()),
                            options = list(
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                "}")
                            ))
  table4<-reactive((tkmk))
  output$table4 <- renderDT(datatable(table4()),
                            options = list(
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                "}")
                            ))
  table5<-reactive((ntbs))
  output$table5 <- renderDT(datatable(table5()),
                            options = list(
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                "}")
                            ))
  table6<-reactive((ntmk))
  output$table6 <- renderDT(datatable(table6()),
                            options = list(
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                "}")
                            ))
  table7<-reactive((lcbs))
  output$table7 <- renderDT(datatable(table7()),
                            options = list(
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                "}")
                            ))
  table8<-reactive((lcmk))
  output$table8 <- renderDT(datatable(table8()),
                            options = list(
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                "}")
                            ))
  output$nilaiunitbs <- renderValueBox({
    valueBox(
      if (input$tahun1 == "2017"){value = paste("33.577","unit",sep = " ")}
      else if (input$tahun1 == "2018"){value = paste("30.115","unit",sep = " ")}
      else if (input$tahun1 == "2019"){value = paste("30.072","unit",sep = " ")}
      else if (input$tahun1 == "2020"){value = paste("29.363","unit",sep = " ")}
      else {value = paste("30.676","unit",sep = " ")},
      if (input$tahun1 == "2017"){subtitle = "Jumlah Perusahaan IBS Tahun 2017"}
      else if (input$tahun1 == "2018"){subtitle = "Jumlah Perusahaan IBS Tahun 2018"}
      else if (input$tahun1 == "2019"){subtitle = "Jumlah Perusahaan IBS Tahun 2019"}
      else if (input$tahun1 == "2020"){subtitle = "Jumlah Perusahaan IBS Tahun 2020"}
      else {subtitle = "Jumlah Perusahaan IBS Tahun 2021"},
      color = "green"
    )})
  output$nilaitkbs <- renderValueBox({
    valueBox(
      if (input$tahun1 == "2017"){value = paste("6,61","juta orang",sep = " ")}
      else if (input$tahun1 == "2018"){value = paste("6,12","juta orang",sep = " ")}
      else if (input$tahun1 == "2019"){value = paste("6,24","juta orang",sep = " ")}
      else if (input$tahun1 == "2020"){value = paste("5,90","juta orang",sep = " ")}
      else {value = paste("6,00","juta orang",sep = " ")},
      if (input$tahun1 == "2017"){subtitle = "Tenaga Kerja IBS Tahun 2017"}
      else if (input$tahun1 == "2018"){subtitle = "Tenaga Kerja IBS Tahun 2018"}
      else if (input$tahun1 == "2019"){subtitle = "Tenaga Kerja IBS Tahun 2019"}
      else if (input$tahun1 == "2020"){subtitle = "Tenaga Kerja IBS Tahun 2020"}
      else {subtitle = "Tenaga Kerja IBS Tahun 2021"},
      color = "blue"  
    )})
  output$nilaintbs <- renderValueBox({
    valueBox(
      if (input$tahun1 == "2017"){value = paste("Rp2.911","triliun",sep = " ")}
      else if (input$tahun1 == "2018"){value = paste("Rp3.106","triliun",sep = " ")}
      else if (input$tahun1 == "2019"){value = paste("Rp3.168","triliun",sep = " ")}
      else if (input$tahun1 == "2020"){value = paste("Rp2.865","triliun",sep = " ")}
      else {value = paste("Rp3.215","triliun",sep = " ")},
      if (input$tahun1 == "2017"){subtitle = "Nilai Tambah IBS Tahun 2017"}
      else if (input$tahun1 == "2018"){subtitle = "Nilai Tambah IBS Tahun 2018"}
      else if (input$tahun1 == "2019"){subtitle = "Nilai Tambah IBS Tahun 2019"}
      else if (input$tahun1 == "2020"){subtitle = "Nilai Tambah IBS Tahun 2020"}
      else {subtitle = "Nilai Tambah IBS Tahun 2021"},
      color = "orange"
    )})
  output$bs1 <- renderValueBox({
    valueBox(
      if (input$tahun1 == "2017"){value = "Makanan"}
      else if (input$tahun1 == "2018"){value = "Makanan"}
      else if (input$tahun1 == "2019"){value = "Makanan"}
      else if (input$tahun1 == "2020"){value = "Makanan"}
      else {value = "Makanan"},
      if (input$tahun1 == "2017"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2017"}
      else if (input$tahun1 == "2018"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2018"}
      else if (input$tahun1 == "2019"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2019"}
      else if (input$tahun1 == "2020"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2020"}
      else {subtitle = "Subsektor dengan Nilai Tambah Terbesar 2021"},
      icon = icon("1"),
      color = "aqua"
    )})
  output$bs2 <- renderValueBox({
    valueBox(
      if (input$tahun1 == "2017"){value = "Bahan Kimia"}
      else if (input$tahun1 == "2018"){value = "Kertas"}
      else if (input$tahun1 == "2019"){value = "Kendaraan Bermotor"}
      else if (input$tahun1 == "2020"){value = "Kendaraan Bermotor"}
      else {value = "Barang Galian"},
      if (input$tahun1 == "2017"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2017"}
      else if (input$tahun1 == "2018"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2018"}
      else if (input$tahun1 == "2019"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2019"}
      else if (input$tahun1 == "2020"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2020"}
      else {subtitle = "Subsektor dengan Nilai Tambah Terbesar 2021"},
      icon = icon("2"),
      color = "aqua"
    )})
  output$bs3 <- renderValueBox({
    valueBox(
      if (input$tahun1 == "2017"){value = "Peralatan Listrik"}
      else if (input$tahun1 == "2018"){value = "Barang Logam"}
      else if (input$tahun1 == "2019"){value = "Bahan Kimia"}
      else if (input$tahun1 == "2020"){value = "Bahan Kimia"}
      else {value = "Tekstil"},
      if (input$tahun1 == "2017"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2017"}
      else if (input$tahun1 == "2018"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2018"}
      else if (input$tahun1 == "2019"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2019"}
      else if (input$tahun1 == "2020"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2020"}
      else {subtitle = "Subsektor dengan Nilai Tambah Terbesar 2021"},
      icon = icon("3"),
      color = "aqua"
    )})
  output$nilaiunitmk <- renderValueBox({
    valueBox(
      if (input$tahun2 == "2017"){value = paste("4.464.688","unit",sep = " ")}
      else if (input$tahun2 == "2018"){value = paste("4.264.047","unit",sep = " ")}
      else if (input$tahun2 == "2019"){value = paste("4.380.176","unit",sep = " ")}
      else if (input$tahun2 == "2020"){value = paste("4.210.357","unit",sep = " ")}
      else {value = paste("4.162.688","unit",sep = " ")},
      if (input$tahun2 == "2017"){subtitle = "Jumlah Perusahaan IMK Tahun 2017"}
      else if (input$tahun2 == "2018"){subtitle = "Jumlah Perusahaan IMK Tahun 2018"}
      else if (input$tahun2 == "2019"){subtitle = "Jumlah Perusahaan IMK Tahun 2019"}
      else if (input$tahun2 == "2020"){subtitle = "Jumlah Perusahaan IMK Tahun 2020"}
      else {subtitle = "Jumlah Perusahaan IMK Tahun 2021"},
      color = "green"
    )})
  output$nilaitkmk <- renderValueBox({
    valueBox(
      if (input$tahun2 == "2017"){value = paste("10,78","juta orang",sep = " ")}
      else if (input$tahun2 == "2018"){value = paste("9,43","juta orang",sep = " ")}
      else if (input$tahun2 == "2019"){value = paste("9,57","juta orang",sep = " ")}
      else if (input$tahun2 == "2020"){value = paste("9,65","juta orang",sep = " ")}
      else {value = paste("9,11","juta orang",sep = " ")},
      if (input$tahun2 == "2017"){subtitle = "Tenaga Kerja IMK Tahun 2017"}
      else if (input$tahun2 == "2018"){subtitle = "Tenaga Kerja IMK Tahun 2018"}
      else if (input$tahun2 == "2019"){subtitle = "Tenaga Kerja IMK Tahun 2019"}
      else if (input$tahun2 == "2020"){subtitle = "Tenaga Kerja IMK Tahun 2020"}
      else {subtitle = "Tenaga Kerja IMK Tahun 2021"},
      color = "blue"  
    )})
  output$nilaintmk <- renderValueBox({
    valueBox(
      if (input$tahun2 == "2017"){value = paste("Rp208,3","triliun",sep = " ")}
      else if (input$tahun2 == "2018"){value = paste("Rp228,9","triliun",sep = " ")}
      else if (input$tahun2 == "2019"){value = paste("Rp220,6","triliun",sep = " ")}
      else if (input$tahun2 == "2020"){value = paste("Rp217,8","triliun",sep = " ")}
      else {value = paste("Rp274,7","triliun",sep = " ")},
      if (input$tahun2 == "2017"){subtitle = "Nilai Tambah IMK Tahun 2017"}
      else if (input$tahun2 == "2018"){subtitle = "Nilai Tambah IMK Tahun 2018"}
      else if (input$tahun2 == "2019"){subtitle = "Nilai Tambah IMK Tahun 2019"}
      else if (input$tahun2 == "2020"){subtitle = "Nilai Tambah IMK Tahun 2020"}
      else {subtitle = "Nilai Tambah IMK Tahun 2021"},
      color = "orange"
    )})
  output$mk1 <- renderValueBox({
    valueBox(
      if (input$tahun2 == "2017"){value = "Makanan"}
      else if (input$tahun2 == "2018"){value = "Pakaian Jadi"}
      else if (input$tahun2 == "2019"){value = "Makanan"}
      else if (input$tahun2 == "2020"){value = "Makanan"}
      else {value = "Makanan"},
      if (input$tahun2 == "2017"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2017"}
      else if (input$tahun2 == "2018"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2018"}
      else if (input$tahun2 == "2019"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2019"}
      else if (input$tahun2 == "2020"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2020"}
      else {subtitle = "Subsektor dengan Nilai Tambah Terbesar 2021"},
      icon = icon("1"),
      color = "aqua"
    )})
  output$mk2 <- renderValueBox({
    valueBox(
      if (input$tahun2 == "2017"){value = "Pakaian Jadi"}
      else if (input$tahun2 == "2018"){value = "Makanan"}
      else if (input$tahun2 == "2019"){value = "Pakaian Jadi"}
      else if (input$tahun2 == "2020"){value = "Pakaian Jadi"}
      else {value = "Pakaian Jadi"},
      if (input$tahun2 == "2017"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2017"}
      else if (input$tahun2 == "2018"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2018"}
      else if (input$tahun2 == "2019"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2019"}
      else if (input$tahun2 == "2020"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2020"}
      else {subtitle = "Subsektor dengan Nilai Tambah Terbesar 2021"},
      icon = icon("2"),
      color = "aqua"
    )})
  output$mk3 <- renderValueBox({
    valueBox(
      if (input$tahun2 == "2017"){value = "Kayu"}
      else if (input$tahun2 == "2018"){value = "Kayu"}
      else if (input$tahun2 == "2019"){value = "Kayu"}
      else if (input$tahun2 == "2020"){value = "Galian non Logam"}
      else {value = "Barang Logam"},
      if (input$tahun2 == "2017"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2017"}
      else if (input$tahun2 == "2018"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2018"}
      else if (input$tahun2 == "2019"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2019"}
      else if (input$tahun2 == "2020"){subtitle = "Subsektor dengan Nilai Tambah Terbesar 2020"}
      else {subtitle = "Subsektor dengan Nilai Tambah Terbesar 2021"},
      icon = icon("3"),
      color = "aqua"
    )})
  line1 = reactive({
    validate(
      need(input$subsek!="","Subsektor")
    )
    jumbsplot%>%
      filter(`Subsektor` %in% input$subsek)%>%
      ggplot(aes(x=`Tahun`,y=`Jumlah Perusahaan`,group=`Subsektor`))+
      geom_line(size=2)+geom_point(size=3)+theme_minimal()+
      labs(y="Jumlah Perusahaan (unit)",x="Tahun")
  })
  output$jumlahbssek = renderPlotly({
    line1()
  })
  line2 = reactive({
    validate(
      need(input$subsek!="","Subsektor")
    )
    tkbsplot%>%
      filter(`Subsektor` %in% input$subsek)%>%
      ggplot(aes(x=`Tahun`,y=`Tenaga Kerja`,group=`Subsektor`))+
      geom_line(size=2)+geom_point(size=3)+theme_minimal()+
      labs(y="Jumlah Tenaga Kerja (orang)",x="Tahun")
  })
  output$tkbssek = renderPlotly({
    line2()
  })
  line3 = reactive({
    validate(
      need(input$subsek!="","Subsektor")
    )
    ntbsplot%>%
      filter(`Subsektor` %in% input$subsek)%>%
      ggplot(aes(x=`Tahun`,y=`Nilai Tambah`,group=`Subsektor`))+
      geom_line(size=2)+geom_point(size=3)+theme_minimal()+
      labs(y="Nilai Tambah (miliar rupiah)",x="Tahun")
  })
  output$ntbssek = renderPlotly({
    line3()
  })
  line4 = reactive({
    validate(
      need(input$subsek1!="","Subsektor")
    )
    jummkplot%>%
      filter(`Subsektor` %in% input$subsek1)%>%
      ggplot(aes(x=`Tahun`,y=`Jumlah Perusahaan`,group=`Subsektor`))+
      geom_line(size=2)+geom_point(size=3)+theme_minimal()+
      labs(y="Jumlah Perusahaan (unit)",x="Tahun")
  })
  output$jumlahmksek = renderPlotly({
    line4()
  })
  line5 = reactive({
    validate(
      need(input$subsek1!="","Subsektor")
    )
    tkmkplot%>%
      filter(`Subsektor` %in% input$subsek1)%>%
      ggplot(aes(x=`Tahun`,y=`Tenaga Kerja`,group=`Subsektor`))+
      geom_line(size=2)+geom_point(size=3)+theme_minimal()+
      labs(y="Jumlah Tenaga Kerja (orang)",x="Tahun")
  })
  output$tkmksek = renderPlotly({
    line5()
  })
  line6 = reactive({
    validate(
      need(input$subsek1!="","Subsektor")
    )
    ntmkplot%>%
      filter(`Subsektor` %in% input$subsek1)%>%
      ggplot(aes(x=`Tahun`,y=`Nilai Tambah`,group=`Subsektor`))+
      geom_line(size=2)+geom_point(size=3)+theme_minimal()+
      labs(y="Nilai Tambah (miliar rupiah)",x="Tahun")
  })
  output$ntmksek = renderPlotly({
    line6()
  })
  output$ifa<-renderImage({
    list(src="WWW/ifa.JPG",height = 220, width = 150)
  },deleteFile = F)
  output$daniel<-renderImage({
    list(src="WWW/daniel.jpg",height = 220, width = 170)
  },deleteFile = F)
  
}
shinyApp(ui,server)




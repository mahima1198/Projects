from gameinsighter.settings import STATIC_URL
def get_images(a):
    img= {
        '271590': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g1_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g1_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g1_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g1_4.jpg",
        },
        '812140': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g2_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g2_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g2_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g2_4.jpg",
        },
        '578080': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g3_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g3_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g3_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g3_4.jpg",
        },
        '552520': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g4_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g4_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g4_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g4_4.jpg",
        },
        '252950': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g5_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g5_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g5_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g5_4.jpg",
        },
        '466560': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g6_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g6_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g6_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g6_4.jpg",
        },
        '730': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g7_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g7_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g7_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g7_4.jpg",
        },
        '359550': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g8_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g8_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g8_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g8_4.jpg",
        },
        '346110': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g9_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g9_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g9_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g9_4.jpg",
        },
        '704270': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g10_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g10_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g10_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g10_4.jpg",
        },
        '381210': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g11_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g11_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g11_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g11_4.jpg",
        },
        '252490': {
            "image1": STATIC_URL+"webapp/images/wallpapers/g12_1.jpg",
            "image2": STATIC_URL+"webapp/images/wallpapers/g12_2.jpg",
            "image3": STATIC_URL+"webapp/images/wallpapers/g12_3.jpg",
            "image4": STATIC_URL+"webapp/images/wallpapers/g12_4.jpg",
        }
    }
    images = img[str(a)]
    return images

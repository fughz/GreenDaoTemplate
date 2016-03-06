<?xml version="1.0"?>
<recipe>

    <dependency mavenUrl="de.greenrobot:greendao:1.3.7"/>


    <open file="${escapeXmlAttribute(srcOut)}/utils/GreenDaoUtils.java" />
    <instantiate from="root/src/app_package/utils/GreenDaoUtils.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/utils/GreenDaoUtils.java" />

    <merge from="root/settings.gradle.ftl"
           to="${escapeXmlAttribute(topOut)}/settings.gradle" />

    <merge from="root/build.gradle.ftl"
           to="${escapeXmlAttribute(topOut)}/build.gradle" />

    <merge from="root/app_build.gradle.ftl"
           to="${escapeXmlAttribute(topOut)}/app/build.gradle" />

    <mkdir at="${escapeXmlAttribute(topOut)}/DaoGenerator/" />
    <open file="${escapeXmlAttribute(topOut)}/DaoGenerator/build.gradle" />
    <instantiate from="DaoGenerator/build.gradle.ftl"
                 to="${escapeXmlAttribute(topOut)}/DaoGenerator/build.gradle" />

</recipe>

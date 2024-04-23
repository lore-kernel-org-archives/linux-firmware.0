Return-Path: <SRS0=oKKZ=L4=opensource.cirrus.com=prvs=1843615586=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFBFC4345F
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Apr 2024 13:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA7D2C2BD11; Tue, 23 Apr 2024 13:37:43 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5B3AC116B1
	for <linux-firmware@kernel.org>; Tue, 23 Apr 2024 13:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5B3AC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N5gE2s003890
	for <linux-firmware@kernel.org>; Tue, 23 Apr 2024 08:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:from:to:cc:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=albv2ESo32Eu8Y
	io3ncAXSxcXW3jRxpNAwZV5pxRVck=; b=XEAzAneg6JP+tJ1jrvFmKRjDUUuJG/
	9FjY+b51oVLxTW2z2gJfWpbe4CB8sgKApjELIdnadFcUNbAHoKQtNXzBFoM8KTW6
	0IGeqVX006HHco/j9TzWbP2hAHRz77Xc8ILQFz4mQrOpIXZiGdAYQUe7agoT8shA
	7tNcet9EfkOH4PodRGFDS6yQFbEfu3KRYChDgkLQ/y0MDh2jHXjdlKA6Ptuug/gl
	Du1E1wFIwPvJhijVt5V339+2PFYueKeuogdbq0/lHTnWO1oLlnmbZyczRDlfXpb1
	tCfMZV4oYqML7WU4mj7qGKlIZm+lYaIDPZCycVKhoiAdDU5hjgC7IRFw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xmb3xtkcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 23 Apr 2024 08:37:33 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 14:37:31 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 23 Apr 2024 14:37:31 +0100
Received: from [198.61.65.14] (LONN2DGDQ73.ad.cirrus.com [198.61.65.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 535C3820242;
	Tue, 23 Apr 2024 13:37:31 +0000 (UTC)
Message-ID: <550e0024-f221-420a-bfe5-bd400603fa87@opensource.cirrus.com>
Date: Tue, 23 Apr 2024 14:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for Lenovo Thinkbook 13X
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ImC7aC_A9SoGv5mt7sB_skXaT4yCoCZb
X-Proofpoint-ORIG-GUID: ImC7aC_A9SoGv5mt7sB_skXaT4yCoCZb
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for Lenovo Thinkbook 13X.
Also removing various Calibration tuning files, which are no longer needed.

Thanks,

Stefan Binding

The following changes since commit e6309bb28fa00cb785cdf0e9129471ebe236a249:

   Merge branch 'robot/patch-0-1713581904' into 'main' (2024-04-20 
21:31:39 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ thinkbook13x

for you to fetch changes up to 8c856e1a07f3953cc2f92c69db922159a1db7ed4:

   linux-firmware: Remove Calibration Firmware and Tuning for CS35L41 
(2024-04-23 13:43:19 +0100)

----------------------------------------------------------------
Stefan Binding (2):
       linux-firmware: Add firmware for Lenovo Thinkbook 13X
       linux-firmware: Remove Calibration Firmware and Tuning for CS35L41

  WHENCE                                              | 665 
++----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid0.bin    | Bin 1920 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid1.bin    | Bin 1920 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-l0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-r0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-l0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-r0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280beb-l0.bin        | Bin 2232 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280beb-r0.bin        | Bin 2232 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l0.bin | Bin 1912 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l1.bin | Bin 1908 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r0.bin | Bin 1912 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r1.bin | Bin 1908 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l0.bin | Bin 1912 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l1.bin | Bin 1912 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r0.bin | Bin 1912 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r1.bin | Bin 1912 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin    | Bin 1824 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin    | Bin 1824 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin        | Bin 1976 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin        | Bin 1976 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8971.bin           | Bin 1868 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8972.bin           | Bin 1868 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8973.bin           | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin        | Bin 1920 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin        | Bin 1920 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin        | Bin 2012 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin        | Bin 1968 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin        | Bin 2012 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin        | Bin 1968 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin        | Bin 1972 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin        | Bin 1960 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin        | Bin 1776 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin        | Bin 1776 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c89e7-l0.bin        | Bin 1880 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c89e7-r0.bin        | Bin 1880 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-l0.bin | Bin 1896 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-r0.bin | Bin 1900 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-l0.bin | Bin 1900 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-r0.bin | Bin 1900 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-l0.bin | Bin 1776 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-r0.bin | Bin 1776 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-l0.bin | Bin 1780 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-r0.bin | Bin 1780 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-l0.bin | Bin 1796 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-r0.bin | Bin 1796 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-l0.bin | Bin 1800 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-r0.bin | Bin 1800 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-l0.bin | Bin 1788 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-r0.bin | Bin 1788 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-l0.bin | Bin 1792 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-r0.bin | Bin 1792 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l0.bin        | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l1.bin        | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r0.bin        | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r1.bin        | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin           | Bin 1868 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin           | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin           | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin           | Bin 1868 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin           | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin        | Bin 1964 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin        | Bin 1968 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin        | Bin 1964 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin        | Bin 1968 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin        | Bin 1952 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin        | Bin 1952 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin           | Bin 1856 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-l0.bin | Bin 1916 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-r0.bin | Bin 1916 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-l0.bin | Bin 1904 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-r0.bin | Bin 1908 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-l0.bin | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-r0.bin | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-l0.bin | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-r0.bin | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-l0.bin | Bin 1864 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-r0.bin | Bin 1864 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-l0.bin | Bin 1864 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-r0.bin | Bin 1864 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-l0.bin | Bin 1940 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-r0.bin | Bin 1940 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-l0.bin | Bin 1940 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-r0.bin | Bin 1940 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-l0.bin | Bin 1936 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-r0.bin | Bin 1936 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-l0.bin | Bin 1932 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-r0.bin | Bin 1932 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin           | Bin 1932 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin           | Bin 1940 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin           | Bin 1932 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin           | Bin 1932 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-l0.bin | Bin 1928 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-r0.bin | Bin 1928 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-l0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-r0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-l0.bin | Bin 1920 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-r0.bin | Bin 1916 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-l0.bin | Bin 1916 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-r0.bin | Bin 1916 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8ca4.bin           | Bin 1988 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cdd-spkid0.bin    | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid0.bin    | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid1.bin    | Bin 1892 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l0.bin        | Bin 2048 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l1.bin        | Bin 2052 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r0.bin        | Bin 2048 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r1.bin        | Bin 2052 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin | Bin 1976 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin | Bin 1976 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin | Bin 1976 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin | Bin 1976 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin | Bin 1872 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin | Bin 1872 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin | Bin 1872 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin        | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin        | Bin 1872 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin        | Bin 1868 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin        | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin | Bin 1904 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin | Bin 1904 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin | Bin 1908 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin | Bin 1908 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin | Bin 1872 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin | Bin 1872 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin | Bin 1900 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin | Bin 1900 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin | Bin 1900 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin | Bin 1900 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-l0.bin | Bin 1936 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-r0.bin | Bin 1936 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-l0.bin | Bin 1944 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-r0.bin | Bin 1944 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-l0.bin | Bin 2024 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-r0.bin | Bin 2024 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-l0.bin | Bin 2024 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-r0.bin | Bin 2024 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-l0.bin | Bin 1964 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-r0.bin | Bin 1968 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-l0.bin | Bin 1964 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-r0.bin | Bin 1968 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-l0.bin | Bin 1928 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-r0.bin | Bin 1928 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-l0.bin | Bin 1928 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-r0.bin | Bin 1928 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-l0.bin | Bin 2044 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-r0.bin | Bin 2048 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-l0.bin | Bin 2048 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-r0.bin | Bin 2048 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin | Bin 1968 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin | Bin 1972 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin | Bin 1968 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin | Bin 1972 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-l0.bin | Bin 1936 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-r0.bin | Bin 1932 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-l0.bin | Bin 1936 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-r0.bin | Bin 1932 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-l0.bin | Bin 1936 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-r0.bin | Bin 1936 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-l0.bin | Bin 1944 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-r0.bin | Bin 1944 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-l0.bin | Bin 1944 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-r0.bin | Bin 1944 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-l0.bin | Bin 1944 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-r0.bin | Bin 1944 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-l0.bin | Bin 2024 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-r0.bin | Bin 2020 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-l0.bin | Bin 2024 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-r0.bin | Bin 2020 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin | Bin 1996 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin | Bin 1996 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin | Bin 1996 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin | Bin 1996 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin | Bin 2012 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin | Bin 2012 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin | Bin 2012 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin | Bin 2012 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ee2-l0.bin        | Bin 1944 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ee2-r0.bin        | Bin 1948 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-l0.bin | Bin 1956 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-r0.bin | Bin 1932 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-l0.bin | Bin 1940 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-r0.bin | Bin 1916 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f1f-l0.bin        | Bin 1984 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f1f-r0.bin        | Bin 1984 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-l0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-r0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-l0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-r0.bin | Bin 1924 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin | Bin 1876 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin | Bin 1884 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin        | Bin 1564 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin        | Bin 1564 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin        | Bin 1556 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin        | Bin 1556 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin | Bin 1592 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin | Bin 1592 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin | Bin 1608 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin | Bin 1608 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin    | Bin 1528 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin    | Bin 1520 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin    | Bin 1528 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin    | Bin 1520 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa386f.bin           | Bin 1580 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa3877.bin           | Bin 1536 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa3878.bin           | Bin 1540 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin | Bin 1560 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin | Bin 1560 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin | Bin 1560 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin | Bin 1556 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-l0.bin | Bin 1536 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-r0.bin | Bin 1536 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa3865-l0.bin        | Bin 0 -> 5468 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa3865-r0.bin        | Bin 0 -> 5472 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa3866-l0.bin        | Bin 0 -> 5496 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa3866-r0.bin        | Bin 0 -> 5496 bytes
  261 files changed, 6 insertions(+), 659 deletions(-)
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280beb-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280beb-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8972.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8973.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89e7-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89e7-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8ca4.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cdd-spkid0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431ee2-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431ee2-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f1f-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f1f-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa386f.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa3877.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa3878.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin
  delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3865-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3865-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3866-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3866-r0.bin


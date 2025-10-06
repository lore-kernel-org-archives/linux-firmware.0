Return-Path: <SRS0=UdDK=4P=oss.qualcomm.com=janaki.thota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEF4CAC5B8
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Oct 2025 11:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 597CEC4CEF5; Mon,  6 Oct 2025 11:18:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8773CC4CEF9
	for <linux-firmware@kernel.org>; Mon,  6 Oct 2025 11:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8773CC4CEF9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5962ThhQ016586
	for <linux-firmware@kernel.org>; Mon, 6 Oct 2025 11:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=juv9V6rLGh6CGra3LvS7ghzA0TaQ+904Ct0NZRQapB4=; b=da
	nLVEQWpLaLpcvAnZ5JdD7HbUOvPuYIzQYy6R31gss/i/JnYR76knfI+NRjyLKu1L
	SKDyLRKnPOMbcUr5Z9amtR+leJdvM0sA991k5VahU7UlJHnxtwhrLq5/aCVq66wC
	oKtBVK6E8dnFMa9T6TjqTQkMibafyZoUK/m3SjUZHCSv0M/PVegOrVnhfnETPfQt
	+2b9YYW7416cNdwkBngLi1uZ+bEgW0PVxS07fteoijje2sgwtH0YrCR/wlQcgGm1
	SZi5qzGJ+EG6W4/sw/u34DdDU5I2Qp1LmBNyAQr0hq/4HbVyiFUP/nzE2AagMnzF
	YKiu6ogVW0pVGXUVOC5w==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jthpusuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 06 Oct 2025 11:18:56 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-43f53560e8fso3922714b6e.2
        for <linux-firmware@kernel.org>; Mon, 06 Oct 2025 04:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759749535; x=1760354335;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juv9V6rLGh6CGra3LvS7ghzA0TaQ+904Ct0NZRQapB4=;
        b=B+qmCv5yB06qpeohGJo+EWPJ7BwKnYTsHL0QHrkWjgcsPQHbzUk154AFZujG50iBUe
         1GWOiyZ6h7ykYUkrsS3xQb8GfvA/Gsm+b9nSLxJsWvRBb7gtcnt6Ro3aLEz2BFhn07+E
         BGTd6t0vVw8YiN+Yz34JIFghzQoiFdxMaMom4LOjc258P72XOzdwiSCUKkFyAuSxBceB
         qvBc2aIDYN9gcBHJLAlIB+x6UGHKfREN7QHYeySjQTSxye3vA315+JWqVYOj9DHCBVhN
         WysOcmoJsI3nvrRGZ8FHxrN5LcBGrPsqv/NSPiYMirKMyodD1+g0lTwPAfCvjdY+YYTq
         UZ+w==
X-Gm-Message-State: AOJu0YyRqhfgXmaV0x9o/xDos20ApX4cNRGOtCPLAgNhdDhNOUusjZp8
	qImuBSvhzKjyWE1vheH4SUQLVOv61PRUucoo+Mpeekylq+fDscBlCI2Er2+M5jxlH2kP7pAVfOu
	r8MLlkCSoucQO3/bCfvChAyUEwH++/u/7y7/mhhbWL9HQ4xkZpIhOJ6y3Jy45pNb3xUu9JfVytb
	N6vnJLX9DbtO9ICorjvUnkzu1RPMurplXSOBBb3r9Z8n7keI/S
X-Gm-Gg: ASbGncuMd2Gd51pXSM+wcLoe38QUbL/Gn7U79L1Wu/9L90Ofuwl9wNJIuPSJPBmxGGB
	Hsag/qmzYaBmyyqT/ziDCjQxEQO2R2R+J6/EIh3U71QjjhPBWxuq5mQdW7sUiSw+J5zWyrQ8fov
	R7OmcfRDT1A+CWOo0diDuf+swG+Xr4
X-Received: by 2002:a05:6808:1a08:b0:43f:4c41:bed5 with SMTP id 5614622812f47-43fc181461dmr6381910b6e.38.1759749535387;
        Mon, 06 Oct 2025 04:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFyBge9ze+ByqhR25pykLgxqoffL2pRsH8B2haJy1WfEZaecGZ93qTPVsmo78YUYVdmEjFvRKEWBfi21g+d0A=
X-Received: by 2002:a05:6808:1a08:b0:43f:4c41:bed5 with SMTP id
 5614622812f47-43fc181461dmr6381898b6e.38.1759749535018; Mon, 06 Oct 2025
 04:18:55 -0700 (PDT)
MIME-Version: 1.0
From: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 16:48:44 +0530
X-Gm-Features: AS18NWB_2HvqPcaICFJr_rrpSQ7gW642gd7jk6s-uQR9c2xEO_hVEKosGc9hwlY
Message-ID: <CAPiVHHi2dk5eX2vRqzX014q__WH=-YNghqv-kZgSfbzGvUgJHA@mail.gmail.com>
Subject: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        hbandi@qti.qualcomm.com, mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: dpc4qbISK8v4JJ0OCpgQkSMYLd1gmmnI
X-Authority-Analysis: v=2.4 cv=N5gk1m9B c=1 sm=1 tr=0 ts=68e3a5a0 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=NEAV23lmAAAA:8 a=b9CFG1x_xQE_ltMtaKwA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNiBTYWx0ZWRfXwSslDUU1Fq5T
 9W4ya5ezF4md60y9lJwFqBy/JmurIBkBa6nBCMeDOf/qawu1BtyE2UwhHelrHTgGhnZwV88Pz2K
 kuPMARNPc8inet4cStS5+zcr/gls8DdA8tioIHjtYXpBmtCqJNXRGe/p9Cn3ynQlqPvu/Sp9D64
 PfNKO2lhybjs+sdUnCoETG9NUOtINhJwicuNvwcFju3XrnyZ+RrDYQkczPEMdFqkTGbrswHIlT5
 R1e3Oynt6Oz/kTexe2LUFTfMFhhSVUreEs8KfXrRT/DHGHx3W/DCR2DoWe6aSv27e47FIApuf/8
 ugCJ6ZXTbAOoDpf9F4PoYsoXqGeerFTXjni+Z/s+GYAzz66QJlffGaYbMmcTHyJ7Om00tsBBbHw
 5nZiNfM9Wz7mtkpcKnwhFFhO5k+/Ag==
X-Proofpoint-ORIG-GUID: dpc4qbISK8v4JJ0OCpgQkSMYLd1gmmnI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040016

Hi linux-firmware maintainers,

 Here's a pull request for bluetooth firmware. Please let me know if
 you have any problems.

The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034:

  Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21 +0000)

are available in the Git repository at:

  https://github.com/quicjathot/bt_msl_fw_1.1.3_00100.git HEAD

for you to fetch changes up to 64b8572f8542709bb9331fd30da0165c4ecfdc24:

  qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
(2025-10-06 16:18:31 +0530)

----------------------------------------------------------------
Janaki Ramaiah Thota (1):
      qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100

Thanks,
Janakiramaiah Thota

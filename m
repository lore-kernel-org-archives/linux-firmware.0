Return-Path: <SRS0=GMwi=3N=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1311CA1005
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Sep 2025 06:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8140EC4CEF6; Tue,  2 Sep 2025 06:19:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8067DC4CEED
	for <linux-firmware@kernel.org>; Tue,  2 Sep 2025 06:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8067DC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S3xw030065
	for <linux-firmware@kernel.org>; Tue, 2 Sep 2025 06:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mjWicwmMDrTCCXHXRy2d3z
	jhflJksHIpHlq9wtlsMcE=; b=csBSE8lFHoeNUK+P0h88569Epl4zF2gUc0xeUe
	XhFqsshkPCQ2tRwaJgxK6tAbgl3T71k8G9g46iTCxMGIVaJCrBDBfsmLf09O7y+q
	X5WkdwkBkbYxdIQXveh2vB31JkYXvEEHulUVIG/1zE3q/qBP8a+7neIDlHhboSwB
	gpczMg3PRV3SIZ3GxaYArPJCmKRlx5gYIgjiYKDwxDV79TFox58ZmjP+arknnO4h
	+gA7qldr0GAi5FG/LsDt+bbHbAJKzqPbA0JvbkjahYxTUDIBqZVfkMSjtlBtm78L
	SxE4J/tnjNdQN5FHz9TitVwG5UQx0zONdleJ0ZT5HpGQgVUQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy2hur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Sep 2025 06:19:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so4652289b3a.0
        for <linux-firmware@kernel.org>; Mon, 01 Sep 2025 23:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793990; x=1757398790;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjWicwmMDrTCCXHXRy2d3zjhflJksHIpHlq9wtlsMcE=;
        b=t4wQI3ol5uqry45mIG0GR+kp+s3XGwNczAKBwaz/BVIdmWSGp/oghT/yFqf3OGMLOm
         SR527zJs7yeYSrDZD5lQ7KQcP/eG/QhbBBv95sc/jNwJCl+UneuTH2+euyUsl391vUo9
         HYh/cBWAs62LgmanT//ueJoxNf9+my2iIVzLabNYFJcvpiB77PZ1oknj/YIsXDMrpFly
         A1srDwZwDpOyYg4kASlbNxHKbI5zFO9XobsttOMjujJyXLogoDiDBHTiBkBWGyQ7iQKk
         tpq18U2teROLTWKnohIpCCOvmJyqVOFZBYIE5LiU6SrN0iDTN82e4zVHwDEshVYUYIYH
         D4SA==
X-Gm-Message-State: AOJu0Yzxw5Z9rY2iyFyW+EcBu3gQrkLvWfJh7Ycv80TI9obTNwfOXPHs
	YU/czHerTDjw4Y4kdABQW/A2o5+/70/puD2R7cHJQRiyfugbIN90McTxPU7B2byHS3I70nHZOjC
	5v2d6ivILG1dlLWUqUmn0hy7bp7bmhbDZXRj6l50TAQGb3F+8o0CORdtN6rmgRc/wr76oZA0=
X-Gm-Gg: ASbGncvYgp7bYWOoKxtmn82/pQwCvyRrGio0EzxAGJP6ycLOM7NVEYPOqfekmcnBvwu
	Zutj2MpineJSZ842Ig5Sy5ql0RUVZmPKMRIqbEwZRs+jK7uG+G0YSKP1qs/Ty/qufgM7LU2I/n4
	JhwoYZKJRQFFuqrIqze6mlSO0zaPEHYKqyEC+A5XWQId3v8Aee6whH7Jl/rCE+DDOMWuiwrpc6u
	geAX768c1qwRadUr/W2wyCIlfQf3U8l5JeN3tQwSVKNYM92A/kpKTCvscdKcDe+kP0z71rlINsL
	6utUmBVmfgd4uJEuNPBZyGhpFTXTxuUc/wDemI+cJ3ODOmoDmTTRZ4mLoTCggIzZZQV8IlFDjj/
	iqU8X8afbw7n6O6JtruFq+zebPJusMA==
X-Received: by 2002:a05:6a00:9285:b0:772:5836:741 with SMTP id d2e1a72fcca58-772583608e0mr7638458b3a.11.1756793989749;
        Mon, 01 Sep 2025 23:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJCG2wmRUG9e5HixeEbnBGVnodDfqwxn/1rCFMICkoGDCo6tNoP+sZv7Ja/HFnll78sncCLw==
X-Received: by 2002:a05:6a00:9285:b0:772:5836:741 with SMTP id d2e1a72fcca58-772583608e0mr7638434b3a.11.1756793989214;
        Mon, 01 Sep 2025 23:19:49 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772538d443csm5850845b3a.89.2025.09.01.23.19.48
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 23:19:48 -0700 (PDT)
Message-ID: <310aa011-9ebb-478b-860e-1c8d13d50a6e@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:19:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for qcs615 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b68c87 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=6GLN0N4NzPbSwDs4LDgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: XGgZQylEUdTrnrFSFfF9fgZTXxxmdTIa
X-Proofpoint-ORIG-GUID: XGgZQylEUdTrnrFSFfF9fgZTXxxmdTIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX4QeG7DlHeq1+
 C+nC+kcHXFbe4jBaiZVXHvxrKkbEU6Yk2s/3KYO1hdoscA2gFRDBEIE3pP8jJHzyJJHkKSxZpWH
 o9Dc/x9lWMDESGYu2qIwg07lR6848upIuleeXIJ/0Qzq+mfdG+flZaWyWf2JySmbtHBCtzZ8/GK
 Tjwwwop3piMCuXLz9NFi9yOAhhJKZAv691xv/wI0yL4hmg3g+4heym//xbTmGrCLQGphmkHmV+B
 1txMnt9PTcIVlPxiU5TGxHPOWhI64tfjM6ZQITTvh6C1fAHqB5bhhOX5ZAox4YN4917PBCYYgeh
 Ck0GC0lt/kGa1t6ILdP3jUN785T58frvmrXuYwmaHNOY83sGRMwGTjmdpR42wwvdxxcwJHp2zuf
 FzMtKK+t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:

   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qcs615-cdsp-826

for you to fetch changes up to 49524f3ee32837eee83bcf7fd3798967e764699a:

   qcom: add CDSP firmware for qcs615 platform (2025-08-26 10:24:34 +0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add CDSP firmware for qcs615 platform

  WHENCE                |   3 +++
  qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
  qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
  3 files changed, 24 insertions(+)
  create mode 100644 qcom/qcs615/cdsp.mbn
  create mode 100644 qcom/qcs615/cdspr.jsn


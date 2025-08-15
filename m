Return-Path: <SRS0=tRPZ=23=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8F3CA0EE0
	for <linux-firmware@archiver.kernel.org>; Fri, 15 Aug 2025 07:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60648C4CEF4; Fri, 15 Aug 2025 07:45:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0510C4CEEB
	for <linux-firmware@kernel.org>; Fri, 15 Aug 2025 07:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0510C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F7SnsX031963
	for <linux-firmware@kernel.org>; Fri, 15 Aug 2025 07:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YTFN/nl+QFiStakvqK6PKJ
	vnw6padDbx0nSJdo0k2mk=; b=ln3sLBANB98pPMDCVQvD3zSnDJq4bICIhoyQNV
	sXWD8oOnFVme5FNFQ/HAEBqEoH53KVNHEfuc2lc1IH3XBgxQzCqe2ZOzhgNPceFD
	kYeOljGS9yDwmdybl27a9ObnFIVDyb/9uXniR/3jWvtmMnIWJSRfaX75BrZpwd5h
	Eiwsn8rpErMJFrmb9ZLFSx9J+t/FEDBJuC9GVpNUQsdYka819JaCAnHy/DvPjQ0m
	EBOZm2RYogojSYKkQ05ke1SVomthpXeRNANrxBr8VqMtItEzappSE9XvZ/3ofhi+
	2iBJs5DyVubRa89+nVMRGZM/2ieYSygDgQItZ70zs9B/qWOQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4p91x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 15 Aug 2025 07:44:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2eaecf8dso1360733b3a.2
        for <linux-firmware@kernel.org>; Fri, 15 Aug 2025 00:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755243895; x=1755848695;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTFN/nl+QFiStakvqK6PKJvnw6padDbx0nSJdo0k2mk=;
        b=m9HoLCYrNunY4K2qEbymP9xCofeD/sAJqasFnHk20DJNXsQ6wuBU3magBEE1H/Vm3h
         TBpAKMWlJd+4RHaCe0k4Dp8YVQnRYG4RKI46BMWNK+nqpEXUoIXLx15Riq+8Bm8d+na1
         Ds80HJjmFMIB3GpUqjHoc0pVaBHD+ZTocYKF4YDerkI/rcHANZTDxETkhieHELIZdGj4
         ruYZnPxDLkwb403AJwtagbH4rXFceGl9jJRABwa0izBCUcm0lA1eCKtIixLoebwMaJQl
         myr0bgd+Gfx8pLrCPs3XROA+TCtvLN7b3ogb7RJJ4BDYArL6VVqDDB+SbF3FNa7lxiQp
         jJVQ==
X-Gm-Message-State: AOJu0YwYG37kkDZtrehyHVVy8p0mNqvwM299u8ECeq4ybgVFiAcRJSoN
	lHLyr9RA/AVN/jBMF70Ak0CXnpGzmuLK7cvD/NTApX+GSEuSzH0HHzUxaKqbCnjLViLX5IeZVgn
	b/fbhYCH36bbZt1uzAZAvdPyjaDb8vb30ShmTOqEw6f/dVljuwuyo55lpsEKOUhAJlhculEBghw
	==
X-Gm-Gg: ASbGncvcx35XVLFvBNmOHfERNWDvVftYHEitlFes3zMy9h+HIiHtH0j50LtF3DhVri0
	NaEH03CATAq9zUdl2v2KNT9Jq6OzDb6Bfec34azvFhCDilLO1XTn8d6aIfH8EPKYPGOldHA+R4R
	JSv38VUIXhoZ2VVF9Fhmv5vGhOZkKy3M+8PM2dpzHZxoVhtmdhATqOR3WCKiv3RIFM+d3nB2527
	71skB7zQs4WgTg8fTJIdm6dS06L2H85Xu0hB+7K08XIy3q3JqsYSyTZ+JTaOJ+Yb131uGU0rQJ6
	iz0koKVrJGxmyHN/Skl0mebj62fUgisMHqc6t1LPBA8Q5OIwij0acdtfuVQ6Xn81UuQj9yU3oi7
	6pJGQdfe8hpKdOOyitzWluGM=
X-Received: by 2002:a05:6a20:7343:b0:235:3eaf:8979 with SMTP id adf61e73a8af0-240d2da6ademr2200803637.15.1755243895288;
        Fri, 15 Aug 2025 00:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjB3mhBoxZRWmDEwvPxq46q3NJyaG3ffNPS7/HhhOdjVLA9mIIAUz9uSh+RKwwb1l97Y0Zmw==
X-Received: by 2002:a05:6a20:7343:b0:235:3eaf:8979 with SMTP id adf61e73a8af0-240d2da6ademr2200773637.15.1755243894785;
        Fri, 15 Aug 2025 00:44:54 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45588c05sm571738b3a.82.2025.08.15.00.44.53
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 00:44:54 -0700 (PDT)
Message-ID: <c3f6d28b-c2a5-4b41-94e9-eb4e55a5e293@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 15:44:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for x1e80100 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 21_eO3eh6KDxy2jkI7lUW5fwcLiD1zAZ
X-Proofpoint-ORIG-GUID: 21_eO3eh6KDxy2jkI7lUW5fwcLiD1zAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX9Y/9RjLv1+RB
 HvQBDiC4g0VY3PxrMYG0as9kB71wewtD+oN0mWFf7z9BcrO5T6unYm0ZZpRnuo2Dj3QYvhUw89a
 jj3zDmLcV/3LfMdDSM9ajkM2xw4d76YPUxmczsCGTSs8MANoTDcgVZJ0buzDXNAx23uhNLywqoG
 9TVDeeSIPflILkzAmnxSZND0LtzW3HYE4vmGM47XuwXIWZnNxsIQ4eUmzq2KhAlORI6PIiweP2d
 55Ihibez8TlUMtDmdrKRW5A/Ro7L2MyLQ4bdtZ48/jXBgYaWXelQ0UJ3r+/31IR0MWUH06aTbSv
 g/2TMEXxPKoc1IpAdp6XS9wveNMIuABi0Yk+hVrVTO/326c00Zz3pws1py9qb0hdu7HOext07hS
 cj3eEN4K
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689ee578 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=9VM-VAtKxY_4FW0Ts9QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

The following changes since commit 08ee93ff8ffa9e8caf2e048a47cdf010dd1bc12b:

   Merge branch 'amd-staging' into 'main' (2025-08-11 13:13:29 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
cdsp-fw-x1e80100

for you to fetch changes up to fec7a9678d1cab182d618ab5fa3919779c0e6230:

   qcom: add CDSP firmware for x1e80100 platform (2025-08-15 10:22:15 +0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add CDSP firmware for x1e80100 platform

  WHENCE                     |   4 ++++
  qcom/x1e80100/cdsp.mbn     | Bin 0 -> 3215784 bytes
  qcom/x1e80100/cdsp_dtb.mbn | Bin 0 -> 40760 bytes
  qcom/x1e80100/cdspr.jsn    |  22 ++++++++++++++++++++++
  4 files changed, 26 insertions(+)
  create mode 100644 qcom/x1e80100/cdsp.mbn
  create mode 100644 qcom/x1e80100/cdsp_dtb.mbn
  create mode 100644 qcom/x1e80100/cdspr.jsn


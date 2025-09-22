Return-Path: <SRS0=MhYL=4B=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04367CAC592
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Sep 2025 10:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC140C4CEF5; Mon, 22 Sep 2025 10:10:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 118CDC4CEF0
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 10:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 118CDC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8wYtC022012
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 10:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QqKDPTTjCv/Xbb+WvvKjrc
	bjDYH1NHRIRkLqvvxbDEs=; b=L7EIZqIONJ/lrRLroKV6LbjYbzaGkalXDPV4Gj
	xl7v8pzDD5G6FC2C9Zn5HLyhSJa5iBiG9tor6zXwG6jFlcXW6oLfPXfLWieZb+jO
	jv4ZxUQ6RmUqhUmYFewBtrdL4QVwhzw+Sx6t3eiG+Tzq0zd7VRsfZFn5vU9UWIQf
	SS86Ct6sSjl4RFRT7iqtR8qK3m9E80QR+RizishtC9tl0UTdsie9bVjIVs7MSXA4
	/SL8UU6aaa2f8itNnZEdcnoqB32cnyJBToDF3Z1gaEj8ZRtkXvAxpNJJKDcIq6VN
	iJlxIOe8JpchP1TcQNL+9kqpsNBcfZQtdqY0UG7oBdwOmTkw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fc8py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 10:09:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f3aa0f770so1637491b3a.2
        for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 03:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535798; x=1759140598;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqKDPTTjCv/Xbb+WvvKjrcbjDYH1NHRIRkLqvvxbDEs=;
        b=Sct20zWA6GaI9fgjeP0rlzPhf4J2T5EmRLyTXjUGH6+PcvaFtQaCojrSTlNQ3Du3/a
         Vc1eltw3psfuJgWC+CpeCpSXmnQ58yIdOL+zPdo4h7hKKDtoZv7tYW/RVKFrqDvgJWdJ
         2fIS8XsGMabo1Ew6kpwhN+tL6JY26xLMF1HkVlhCRuH4929zH6HTkIr69fXUSiIQHI65
         cuy2j/uRjkmYHnN5NuwvKXBQCFfCcoJXgQdVg0/6QLVqvzp3bYVZFVmOnWqv02h6Ux/b
         j28qc/lAos/aPyBlnGKqVZ6iR2+P/1m9WWhSqj40Z5nDlQppAPqDy8EQ5S7DTpoqBHZY
         Mgow==
X-Gm-Message-State: AOJu0YwuxnG03uJ7XfnALREHle635U6apM2TiWaTN2ZP/PV+I8E17qNR
	y8ti/pLSK+n/fr3rZAtaR/H4cJTkRXgjSDMeG5zpkEpSea/2rd9XTAcgge/IEms05DUhxRg+Atw
	GIIIXRwuE6WBEgYME+FmLKbF1RmHMdulcWJbv4dbYIdY0Oc/l4/5C65lnfL3+I/FEXSpJD1BOSQ
	==
X-Gm-Gg: ASbGncvfNvXpMMIy8I4RcS4yJ7c4EAWiC1qN7zbvLF2pUalWcKi1Bjb8fQYcS1qeMbd
	vCNvpQluy5w0aODJnEWzM+0e1s8ToFyvFAwr7BC7UcJ1QzY9ReTp5EcEU/W8finf57TQiFNKTQe
	wq95855YehqJ4Xy6FFykxQ0rzhhiPrtDQdn5cOsESzZh2Y4h5gjiRgXLlt/9NA9lWE1IL+jOaUn
	P9IyMPvypyBH9eFvo6QmbzQhLSG+2LkfLcHSeaeUbtWsz0oAbsMMYiXpozC6nVl3J9MRmPtIat8
	xU7DUdcip11skv+NoCnlBqTllG6gpZ3YlLF9vfKojXjEgX3XjokVTuVwELHTd2h/rYRe
X-Received: by 2002:a05:6a00:230a:b0:77f:3e56:c1c0 with SMTP id d2e1a72fcca58-77f3e56d116mr3374199b3a.32.1758535798177;
        Mon, 22 Sep 2025 03:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI3F7I1iPPBxo2Y2qWenNGEWlp2Uv1EYpDDrIhByGqAIHq2vJc8SuJeakYNOBdW1B2P6Kh4g==
X-Received: by 2002:a05:6a00:230a:b0:77f:3e56:c1c0 with SMTP id d2e1a72fcca58-77f3e56d116mr3374174b3a.32.1758535797802;
        Mon, 22 Sep 2025 03:09:57 -0700 (PDT)
Received: from [10.204.86.37] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f34d093a1sm3016838b3a.103.2025.09.22.03.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 03:09:57 -0700 (PDT)
Message-ID: <575b65b7-a9c8-481a-bdaf-bbab39389b62@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 15:39:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: bkumar@qti.qualcomm.com, ekansh.gupta@oss.qualcomm.com,
        kssb@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gY8hP5jUG4seIvWn5j1SA-3DUK3zECXI
X-Proofpoint-GUID: gY8hP5jUG4seIvWn5j1SA-3DUK3zECXI
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d12077 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=wp4wXl4pNmk1L8nDeC8A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXx/xPoRMu5eMk
 +zmGVF4/fy3WjTWinQdqye/RhWaft6KMjiVxzNO72TW9dCppOK8toC/pVftVCbOOsWv6ZVLztie
 qEqwVJsJgf7qEL6Vz0MQ///nerhcorHLfjmF8NShan9eQ3qlnC5asxs+XfQ+X5P1E0xazxBpb8M
 UJI2mNhSuLIxCxd8AuAia4H9oSiJCDOZmvvKHXlIarsSyDtr2DxnAwM2h+qsGTICXiE5swx5F0c
 ebZLaXAy/i8qQBSYuh/gd1z2d+de3fptYQ238f0sGH2HfR41x/A4SzeRnXrdZs9wFgpYulzw0Su
 jcVKMICTy+J137KaBBI471nMNN89FvylzaTyX0zkPMuG5o9qHTy2Ibs4RciAPjwHvN9tL6V5ebx
 rqfw4BCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

The following changes since commit 493de17dee9901605e69ad804815cd7408d84547:

   Merge branch 'robot/pr-0-1758303798' into 'main' (2025-09-19 18:33:44 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-qcs8300-dspmon-125

for you to fetch changes up to 704b227a99683715bc8f3fb514bc6b9d18372f28:

   qcom: Update DSP firmware for qcs8300 platform. (2025-09-22 15:30:25 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for qcs8300 platform.

  WHENCE                  |   6 +++---
  qcom/qcs8300/adsp.mbn   | Bin 6643712 -> 6684672 bytes
  qcom/qcs8300/cdsp0.mbn  | Bin 3084288 -> 3080192 bytes
  qcom/qcs8300/gpdsp0.mbn | Bin 5832704 -> 5873664 bytes
  4 files changed, 3 insertions(+), 3 deletions(-)


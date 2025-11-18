Return-Path: <SRS0=041a=52=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A468ECEE33B
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 16:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC319C2BC86; Tue, 18 Nov 2025 16:39:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8938FC2BCB0
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 16:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8938FC2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9i0lS028363
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 16:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YKtkwop8sLcqV1Jx0LE7wg
	lPfGix15wohVyqVpHXSkw=; b=X3+7G/tXJjwMCen+w2ziddwN+Xwl1tOVzZ854W
	hL6a/zJ6oBqyMa/X/l01EDXrECpc7eOrSn1tJQ6Q2smMSiWmp6eUbu0VBRmufL2G
	vhPtmeBIXAulVkntGWcI9ZU78LtNz/10wjOwBF/5UhSHVVj1/JvEFeiWt1Cz0gMq
	eGDbGYgQkCBHhOrMOCP7+LntxiFL+6i4v3KWVmuG6dssrYYV3b2h2Oumo3coXX2e
	D0l5xMxDQi37KjJx6Kw21fp8nMTuPXk1GEe+kqShjaQYrHcx6UDl7c4JyAgl2TTB
	lEL98ihr0JFG2m1ChGTAAiGwoMDCkSHtWVuNFmb1uuk719fA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t3ta0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 16:39:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2982dec5ccbso99501135ad.3
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 08:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763483942; x=1764088742; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKtkwop8sLcqV1Jx0LE7wglPfGix15wohVyqVpHXSkw=;
        b=fH6Ka4iUJzcv/bwmfPgrbgInoMQGSOI0qV+3c+whs5tzkNxGXi2riqTv6hQK6W6f88
         bCQZ1M/1T6ScT+Ir04OB5SkMh+j7/wrEY4xqkWg2OpBwLoTjpzTI1zW68U22q2ur8SSv
         cpuDTOIWWP1NeYX4GEBtgz8xeG5V16dGWkLmTXRQGnK/qF2PZKTyRDj11/BnBXGH1E10
         r8FWop0YTj6rPwclSXngFHowro1dBanlBjT4/sNLlMqtleOW4ftZUXcfG11RCShI9+Bh
         c40z7pDPc5iD4Zr4YljuXT6S4+5hOXcQmaP006dlx3ycpZGeNtfpaFRjrOTVLr/1ka2S
         yaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483942; x=1764088742;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKtkwop8sLcqV1Jx0LE7wglPfGix15wohVyqVpHXSkw=;
        b=gLmYlolZYVkL8lIB9nTR3m9IYuPLe36l+kGd96J+qZfSIwr45JdBGqOyRbj8Pfh0d+
         HK6H4ebfqRiEx6VsNhVT4WUlZvHw4F58pos5RJY/wdG14OBG6Xyi0O7Z9e0KdwMurY/d
         I6S/ZEiY65AO/eCZq2REH4EKJBx/QgBdGAaFWEZtg+HB/PCvOkRy+nqCQKrJYywEp0Hu
         EzJ5VM8v1ZGSRqrwm4eoNnongulrjMO4x5TQ2aL/+JPE8qBYslHwcG1c1nzghBLTHGP/
         KMsfPP0z9uKfy676NiNCdnbYBkxG2cIej5tLkTYD4woXvroAnCQTM4WlWLUuxKGIuN9O
         aQKw==
X-Gm-Message-State: AOJu0Ywn1Rnj66ynooguZ8Y+c15O2EdlKqVSrjcHPmOXE8eHlOGPRLR0
	Cc60ENMhi5g6YVOfY3qKGVj1wFAiTwsiV0XeNAQUqhMBYKtYst64WFL17uDM4JjnPoguy6lcCkt
	+KB7U9SVpNuc+x3Kkx3jK0uSVrKN+bY5CF4kVhCM90WI7cm/TvtixZ3jx/hUcsJV0+hxVsio=
X-Gm-Gg: ASbGncseRUgk+8J/B05SoS83XcAtNyW430/xOPYCatmlH6Hr8p1TQJpENgcb4xUvMRK
	9DRty8J8Py0OCwegXKStnclWm29Rd6mzmuFdc+TJLWKFCl0axu6nV7UiJTvWZ6v7LTGJK6KFYsn
	p+A4kZa3bFQooieSSjDmR8rCbgH3qIEPcRlhyQgkVUzGx0d3jRwNoe46XDlnEnRQ2Qq2Gyql/0B
	xEu5v7EfcfCjSsPSHCpqbYrU3xJmrDr6lkHMkI8OsKx/o5tNcG8MuQHg33Qko6BmtZU+diKnawF
	g5giq6CjT+Vt6+fhR2GBYofEQXWQWZAqAdWQX2G3Zofb88KmDg+F7TZYu3FNMSHHQfqeugZB7+4
	MK2TFY+cVgzjpzfekMfYlK2PRoFqwmYg=
X-Received: by 2002:a17:902:f64b:b0:295:5668:2f2e with SMTP id d9443c01a7336-2986a74186bmr204101385ad.37.1763483942417;
        Tue, 18 Nov 2025 08:39:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvmNFPjKe7k4hDBINx2uMfLxcqh2uqerY7oV+2r4bp+WQ9J9DizDcTGB/+ubYLk6MAhpWy6A==
X-Received: by 2002:a17:902:f64b:b0:295:5668:2f2e with SMTP id d9443c01a7336-2986a74186bmr204100965ad.37.1763483941872;
        Tue, 18 Nov 2025 08:39:01 -0800 (PST)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234889sm180302105ad.13.2025.11.18.08.39.00
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 08:39:01 -0800 (PST)
Message-ID: <ed9a4b17-c97d-4e43-8e73-444d9a10ac08@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 22:08:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add ADSP, CDSP firmware for sm8750 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzNCBTYWx0ZWRfX5qBZ15s2C+Y/
 pxj0oKaBIjZwXd/UqhHVJF8aUG8Zmd/s7vPrFHNp//CZkk8n7xRvUQclsuuER10egDGFxQyraU/
 ao3DXAfIVaS0yLF/4coS/YuN0AThZpADajPwThFkB1FzCEZ4FlCNLy0eVGUQRL708t+7C+cF4sr
 /xt0KVlLkB9oBsbnK0cXMZTK2fqV1pOmLsif3B+72Y7BkawiYDD6u37UySRhtT9DVMRSp2b96wu
 MTxjYmlwqb440ln8M0IM03nj9JmUZVezH7MEHGNiRHHmUuxNjo5H3A3ZB5xi6PNTtqE+RQeoze8
 8ZwzD6EF6TjTbFaGdvwUQ47cXWeX+SznPkrzY64djkKnMiRqhHPEEd8uDqj9emHDDzF9eisH39w
 hCijwagWc4SodoIHhVVnYDNSL6jR9w==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691ca127 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=0giHzL2bTdqBlseNzmUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: qyEchpyw_K23ZUR8l02nRPNPq3H3r_vh
X-Proofpoint-GUID: qyEchpyw_K23ZUR8l02nRPNPq3H3r_vh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180134

   Merge branch 'robot/patch-0-1763433586' into 'main' (2025-11-18 
12:18:24 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-sm8750

for you to fetch changes up to 094f6b6193169441da53cd1ee54d5354e444fdd7:

   qcom: add ADSP, CDSP firmware for sm8750 platform (2025-11-18 
22:02:50 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add ADSP, CDSP firmware for sm8750 platform

  WHENCE                   |  12 ++++++++++++
  qcom/sm8750/adsp.mbn     | Bin 0 -> 19421576 bytes
  qcom/sm8750/adsp_dtb.mbn | Bin 0 -> 180024 bytes
  qcom/sm8750/adspr.jsn    |  22 ++++++++++++++++++++++
  qcom/sm8750/adsps.jsn    |  22 ++++++++++++++++++++++
  qcom/sm8750/adspua.jsn   |  29 +++++++++++++++++++++++++++++
  qcom/sm8750/adspuo.jsn   |  22 ++++++++++++++++++++++
  qcom/sm8750/cdsp.mbn     | Bin 0 -> 3912104 bytes
  qcom/sm8750/cdsp_dtb.mbn | Bin 0 -> 36664 bytes
  qcom/sm8750/cdspr.jsn    |  22 ++++++++++++++++++++++
  10 files changed, 129 insertions(+)
  create mode 100644 qcom/sm8750/adsp.mbn
  create mode 100644 qcom/sm8750/adsp_dtb.mbn
  create mode 100644 qcom/sm8750/adspr.jsn
  create mode 100644 qcom/sm8750/adsps.jsn
  create mode 100644 qcom/sm8750/adspua.jsn
  create mode 100644 qcom/sm8750/adspuo.jsn
  create mode 100644 qcom/sm8750/cdsp.mbn
  create mode 100644 qcom/sm8750/cdsp_dtb.mbn
  create mode 100644 qcom/sm8750/cdspr.jsn

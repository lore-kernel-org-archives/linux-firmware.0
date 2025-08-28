Return-Path: <SRS0=TCRX=3I=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C673BC8303F
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Aug 2025 14:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95496C4CEED; Thu, 28 Aug 2025 14:36:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C35C0C4CEF5
	for <linux-firmware@kernel.org>; Thu, 28 Aug 2025 14:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C35C0C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SBLSqa029850
	for <linux-firmware@kernel.org>; Thu, 28 Aug 2025 14:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XjZ3jX1113k8dvFlR8NXrb
	bl126/WddYFoCad8ZhqNg=; b=CHFBY08+ZwImMbXRu5kSZlY82MC5tAyuiH3IXv
	L4gzBww7ikVz7mXzwHlJAu9Ejiii6i7G5WWbcTflYsRaY58L9mUi38ES2Oy6GsJ4
	OzMV/aNRdg3sRrs7r3p3CEZ/aXYk35wyE8ypSGu71/96gOL6vMYA1PyLoTT4Z7oT
	Jn+v6R97ecA2zi8UDF7BOMvfQB6M4d833ysLh5fVj4eEZ4EQTOTtnqQreeP2xZXA
	9ALRkqvIOcouoSVjAEIXoe85T8I9SYZcV2sL1mU/UZULrQSeiWCWzc6u3OjDZokV
	7hJPT35cuVg3eNW5b7MuOTO/1Ew30Ehfmg3OPNzbi/IOPF7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tp5k0g68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 28 Aug 2025 14:36:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-246cf6af36dso12052565ad.0
        for <linux-firmware@kernel.org>; Thu, 28 Aug 2025 07:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756391786; x=1756996586;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjZ3jX1113k8dvFlR8NXrbbl126/WddYFoCad8ZhqNg=;
        b=UQUXSGHH6b7EBeL4+EQIFrCnhlJp6gT6I9ibC1NL4C+GdEhwIMA3JSCIvRAEvOBh+s
         GHvv0VSHzQ/eUqD7mbYcwhCRuNTlX2x5BHCJ2QowQlXuw3FZgC/9a0PoyERNxkNCgceA
         JGcNXyj0ES/NBxRriJCLmpw67CsYMZ44RD3Q6VUN5ivnwQuu3K5bgv6/2SXgjNfLPazA
         UG35RkBRz6Oow5uQ3O1+5c1UUyoFo4WW/c2y2Bsrhhf3+fKjycZyecJqrO5JCjJUXB54
         mwNw1l36lq84eiW1eGdPvZyUVXOBxQAZyPQAYxi1PssXe/ApVCzN/UVxJkN/roJuwhXk
         QPrA==
X-Gm-Message-State: AOJu0Yynlu/VMfa2RRmtw4C/gwIxVE9/9EOQ9feOxtx5chX6fEGdx5Ae
	Q7JgWGsdDUJSsKWE00NBF8XwQztroNAKg2ev3mu9mBH6FpEzKFe52axj6ZeyPLjlSbXCmRKpdTA
	EUqu8QAdoBqBZNDOfoZJNs70Ak4BR5q15bEqRnR2Vwc/jVgl1d1jQ7J5pqR6TooNoT2rZkQ8=
X-Gm-Gg: ASbGncvsdtgKCdpZf5a9cODjAuoba+1Gd5cVAun/GkHPM0lJZFM8ZmzXcSlC8q8B9gT
	fzBlhxHSmogflYhrDaBRUVz1U4Md70GFB5GDMjYZ0usFwsfgnS0cMTyjdD4d8ySOoCGbi//STkh
	rXtWYAWqp+FHs7ZPh/5z4QKLnULi/IhOASTeUBdWTI24wE8ivo8tjV3mpLW9cV/toVrUMEu3Reo
	XtPCrUxdrlPr7KEcaznaU+CD/UMntsdfBeVDUsVY4kqgmS+7JnfJ43kWYnByFzihX+bDvIMdMR4
	B+Qi8Ols9efoPmfMQvsyisFlXIMaCXPNkg6yvRDvg6+WZEjA0VFXAFwmeFP+WiDsXQeFvt9JeFS
	4
X-Received: by 2002:a17:903:2287:b0:246:f14b:31d1 with SMTP id d9443c01a7336-246f14b3365mr173812605ad.32.1756391785830;
        Thu, 28 Aug 2025 07:36:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL2bqK0GrWCTia2+2Ggcvj+uvADGJopEJM1qYkYmwTlTNYATTf2IHqE+217g1/8c+O+RYceQ==
X-Received: by 2002:a17:903:2287:b0:246:f14b:31d1 with SMTP id d9443c01a7336-246f14b3365mr173811965ad.32.1756391785205;
        Thu, 28 Aug 2025 07:36:25 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24882c840e1sm63260945ad.69.2025.08.28.07.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:36:24 -0700 (PDT)
Message-ID: <9eb91098-48a6-420f-bb6e-e7968ab0a2e4@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 07:36:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath11k firmware ath-20250827
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9F90fni c=1 sm=1 tr=0 ts=68b0696b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=K7P3aSCmrdTuO1j2XbMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5NSBTYWx0ZWRfX5fMvQcg4+LY0
 FroJRi4z4iiNSgFbSeEx/yUn3N6jrBLQLiNFWa8bMeC/MtxQ5HRmfFmfNJIoIX1h65YELgvA0eY
 n37NNJEl95z1WOF1lpetDofWZtHDilx1UQ7j2rySmognUK9SVDxQ4o6+22Ehetpbat7lkCplv1K
 kP8UK4DAZ1jZwNlpo5bWOx/k3Sm3tYgxmRZpnK/tu2TuP5bSNzGAOn7KAqndxwH4tSVyY626LKr
 /hm4DpeC+R0Qx2KfkyiP/8GrfusywtctiVFhwaxF2Bn4npcRAHZZqzVR57aG796cRU5Sf7DGOOp
 w80lC4PBupSRz4nkOCkJUnMjFdEjSVhUp/YFhLcJc40xNRGFVI8rX9Lr5hMF/7rLG/siWxbvKjC
 zJZprTtj
X-Proofpoint-ORIG-GUID: 0VFgFQ3b2KOr2I0jA9hYBXByVDIQFjkC
X-Proofpoint-GUID: 0VFgFQ3b2KOr2I0jA9hYBXByVDIQFjkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280095

The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:

  Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250827

for you to fetch changes up to 0cfc1632ef7b1cc15eea36214fc67098f6d49531:

  ath11k: Support WCN6855 hw2.1 with NFA firmware variant (2025-08-27 07:43:22 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath11k: Support WCN6855 hw2.1 with NFA firmware variant

 WHENCE | 2 ++
 1 file changed, 2 insertions(+)

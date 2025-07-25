Return-Path: <SRS0=4B/V=2G=oss.qualcomm.com=viken.dadhaniya@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B258EC87FCA
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Jul 2025 05:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 657BCC4CEF4; Fri, 25 Jul 2025 05:58:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F3A7C4CEE7
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 05:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F3A7C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLmI2h015251
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 05:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N0wt0EgykjXkcQXJJnl+1A
	6XiCcaQrgVD/O0bTjSQwY=; b=FF4ZctbK/S3pICR21WPckvlbelz38Kc+h6j+ry
	Sf+ID5LCphBCjzCnWH1jCASkrX+CK2BHTLptm2jq8cFEQlXsy+W+paTOVX7t/ozy
	9Gpvy2ioSfyENERe/DPPidy876wrHpXVplfQ6if44mBKBBqLHDZYzfGvdLmo0T39
	Yvf6GAkaG17a2ViEk7sT3mbRljWwgdZcmaYqfnTvyFngTm1IxFO6cB55ydFCIhYw
	T+bOY6KnOB3aJARqARy/NIyjTaWPdvbtBqCAsffuyHVfcjPP+OUZo2hZMSXagHEd
	WkWmLftfjYt5W1O1btqEvG3Lz5EQuBWwY4NqKHOQgrdSyZCQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2qgyv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 05:58:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-237f8d64263so18117955ad.1
        for <linux-firmware@kernel.org>; Thu, 24 Jul 2025 22:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753423115; x=1754027915;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N0wt0EgykjXkcQXJJnl+1A6XiCcaQrgVD/O0bTjSQwY=;
        b=vy5GLKUn3ZWsZJ22H7PJJUiZapt6EyuF5r3gekPkYdCKch15XBgZV9EQXrpKlWSAQr
         IpyiX9RDLKw/yN69IOLUydUhcJQPdtKsh80Kw4/dCRFwPm4tNqtFWrC2dym3IASzLeqm
         +B1DNExxrknZ+WyWJnMo8lSP2RLShAvzU5OrU4bo6sNRh2DDiIP3JLpccFIYb/9V1zL8
         mSb7xygCuwOEu8gSsXHzlE0WOmQuOst3Q2MZso2DM3wIC8e5l3YPcAm1W88XcJkYSYeP
         TDCitv6S8ZVcVDXW79VOwHfrkouMMCgs2gSLLBF2XULq3nanddhVYFkRMLCv53X6AZLr
         1IqA==
X-Gm-Message-State: AOJu0YzveLJGttironc27DnMLMdq57zFna4uXQJQWDOgx8C02LYffuoW
	jKP6k2ePA3w6IsEGWWXGwu8CawpZbAnD9LSf5H+8a2eLW3j4k+gZSKCDeXF4D2VG6ygl5DFoJRe
	1/1aSGOA2wUjclzrdYx7ixerBZDjHsfWRAXWVQ94kZI2wno8BJd37teFdLGE38aV9Aw6LxDA=
X-Gm-Gg: ASbGncvALErm/SUi+eb5Sqzp589+E92H/SGesQAVBZDRgdCizq9wKoIUP847jR6O2xu
	lzBEhK3pFM+u10763Qp20nTk2Jk1ZPUSY29jitKValaxgQvR0Oe7LRKofIXexH8kBqvOILwwpQ3
	IjhUsFzQOxPkpxkzMOU34EY6kPcgiFK1tPfySOeRgCAm+4ZROtOkiAFYXP0OA0WaxyKkeWQzJ05
	Kcg7aIBzpvTyjUBNQK4T+ENNngNVOtrouvh16W+b3m8p/YHFovbs+Un5VANUmiZzr2yO1YMiU4f
	CxCfZhDz2EWRP5s+joTVElo+Gt+F0tlfSR8gVkx1esqoVqSlOnZIEhCQEG5cYYig1vHVYwht
X-Received: by 2002:a17:903:1b2b:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-23fb3050848mr9180535ad.1.1753423115029;
        Thu, 24 Jul 2025 22:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvUiazeEBKQlq1v5Z6VowfsZb8UnqBgdDefxtgcfFf8nyYpvw+64ySytNegdeS7AWyKzlesg==
X-Received: by 2002:a17:903:1b2b:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-23fb3050848mr9180325ad.1.1753423114570;
        Thu, 24 Jul 2025 22:58:34 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc71csm28721435ad.83.2025.07.24.22.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 22:58:34 -0700 (PDT)
Message-ID: <495fc2f1-726d-45dc-ee84-ccd1e88f467c@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 11:28:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: qcom: Add QCS6490 symlink for QUPv3 firmware
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RbqQC0tv c=1 sm=1 tr=0 ts=68831d0c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=3FHW5O8K2hF04SmQ_4cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA0OCBTYWx0ZWRfX+fKJjz7gn07E
 sTiuQ/mCyOnd0o7grCU890XRSJGUbK2clVuAh2+XWrQOZoBVyQa12qJjNbJTBDvcppF5+6wQ/lY
 kZEA8NsJsPRNAmQ0baM/GT/KXg2JQgUYiWNkFyv2d6WPsuonrLUU+5G3EcHRewiMKuO53M4fvuz
 iK0NxF9Tr4+GFIITVS2ijtRqmMcenPxyx+QY+R7cmrZEdIDcbXM/9JUq33Y6twmq4oWX57TzAdG
 VzjU8iX/A5tsaDoMZCJYWYoIGM3mEPLO6QrGVCetO5K68aVIIC+yi1M6/x9lA9UDfCrw0FUosnu
 U9G6G9mzT4ldxneVCO0VIfXVw/DVRrav8Qi4g/5PRPV231LAAfEWYeX1ZluBDPtXfENP3ikXdZ3
 eNhrdv7dpHmd2UmqNeYSsVtM1q0XOOEPYJW93mq20O1gLngxiO6R/zXwkshU7VvFf49191Rs
X-Proofpoint-GUID: lUpi4GRzsqc9smsIG7tpE5EDbWz_eFl1
X-Proofpoint-ORIG-GUID: lUpi4GRzsqc9smsIG7tpE5EDbWz_eFl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=748
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250048

The following changes since commit d89120bb80fc9d4ae7c7485033306acc12e306e5:

   Merge branch 'cs35l41-20250721' into 'main' (2025-07-21 18:56:30 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-qcs6490

for you to fetch changes up to 8cc24d2326065a093bbe080a0b3b197ad8ac1905:

   qcom: Add QCS6490 symlink for QUPv3 firmware (2025-07-23 15:36:14 +0530)

----------------------------------------------------------------
Viken Dadhaniya (1):
       qcom: Add QCS6490 symlink for QUPv3 firmware

  WHENCE | 1 +
  1 file changed, 1 insertion(+)


Return-Path: <SRS0=FPJa=7H=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A1CEEB57A
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Jan 2026 07:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2854C19421; Fri,  2 Jan 2026 07:36:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9571C116B1
	for <linux-firmware@kernel.org>; Fri,  2 Jan 2026 07:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9571C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601C0PBa2254973
	for <linux-firmware@kernel.org>; Fri, 2 Jan 2026 07:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FbWyDNaeRBiYermon6SoOC
	4qkreZFmOuQrqMIdRgor0=; b=lq64SNQ00ML8mwPc1QaBpWUofIonOlBN45eE43
	dT1BG7BIY/xCJ8PfRaX4u+kQ3M6vM3d2MMZi28yrc+l7WXosh6jmiUwNNLI7AH6e
	Sj5UNXg4+ePCm1P3yxz31XMRBUnVrT8lq0a74l6Ho0GTIN7cSprJzeAeSQiIUxjS
	YBY7nvj37rzkyn5MIAcBqH6tJ2daONc3dfnrJE/zBqE6ELX1NAAgpST9a82y58d5
	vNopuumGbMXq05NIcF1ViyjOn2amTon7TzURp/FVW1JahG8WDlE7CmrhXKH/qu5z
	9D7VZ46ckrpullqeCVSVxbIx/FmeAlb97rGCIsCZQ8vOxb0g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd76nawbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 02 Jan 2026 07:36:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f69eec6so149110685ad.1
        for <linux-firmware@kernel.org>; Thu, 01 Jan 2026 23:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767339405; x=1767944205; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbWyDNaeRBiYermon6SoOC4qkreZFmOuQrqMIdRgor0=;
        b=O56pKRFUaQOl31ZzJDcoalDXFYveTcfUCwtNG+jvQRlwPa8CirbQfLb2nqOvinFR/J
         EgzleRLDChgeu3LBojA3c8hbUP0jtRxI4GVIKKVEwFdqF1yomlFo7NMqLlECJrY9X4i0
         tCTkEGR2uyP/u650x3Cz5kIrKQOocx8s+YMwAkq+DiKwFDBXepaoIkKHzDkyX06ZE1Cs
         UQyInqBhAAhTJ6f6pFD+zqcyT7WEGX6kFe83a21EBzSf0XCCwPNV9V86uQbh8ClJlTzn
         OQ2KjsBAsIb1BsJuj5SFgBbVEB1w3qsfwEVKSrG4OoJDqSBP6cDuNeq2GbeFc4THKuqU
         9PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767339405; x=1767944205;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FbWyDNaeRBiYermon6SoOC4qkreZFmOuQrqMIdRgor0=;
        b=TF3DCgnmDBJu9Oaca2rflu/PywAhi8MTdBThwYg0vZ4Tz0AlA8QskyP+Yp2fEtcKL1
         r+5pgJBOgEAPaR5YuQsP7C8EjLX86SRpK74vNeup0YDlQT79TrycQUvAn5w55M8ZVffz
         kUtTjy6uNH0JAJeFzIVNo/cgzTR2dICBBjfryhHSKQPSBujucRtSDEpJ3yBQPbxny5B1
         zccoD2R0TJZ6oigbOKHS9RqWoA33f8ySZy8b3qKIPdOYgbKNrwvHV4VDlQpn8fPUVOgR
         jJF8Iw41aAdqAuDW24MJZ9T0OSh+VtTcagxqRvq1/vKC1C4Q1+dgj9gw3JWWKXRXIpTT
         tNvw==
X-Gm-Message-State: AOJu0YwgJb36XC5J9ADjId4tYtsmSJLRfNVGZLc/qCRKinLKHRqx3o3P
	5tmydMVxd7NVHev+Xflx7G+DBUCw6NbVZv3TAw1EjHkW5x1nIXeiIlgCkzPDw14H/uyNgL1r+Bp
	/GFggWbBC4DRJyXkmiDnU3j0hnRx5a7APYLbu+WBtIlnc30j10TB1QDnAeNKARQxdh6jCERY=
X-Gm-Gg: AY/fxX5iYEdlp2td2zwB3nYJ3r+ByKu0PWgxQ7j/jSR6or+PyuUhFqHvBFAVvELmo6h
	sWMroqm5V9vQeleNow9xTSDTC4OJ20mwDiSDj90gqKnzxa4/uXU21RMBc3ZkH2GMFe6Q1i9NQRK
	d9H+d/HzrjS7zHToGj9AFD3QhTVjXgF1RIcljLJGS6ZkKC+JzbX6MlZM9CD8sbTguUVYkaM7OT2
	oXXyBnouPcs3rARKUS+Y/eb3TFsIgNeqJO0OziNBSuTSwULfvq0vqt/NXduuKTgY7xdyQ1LiXX8
	fMd5ZYRjNpDsgnNwxD+lJpWXirQcZDtSYl9n+ja3xHJKmF/TGx7DuutrNWBxSTI9qs3WWv+zunB
	zY8ulCyneZlhCiuOJ/HhgIufcvypdQNJE76C7zSfBD8I=
X-Received: by 2002:a05:6a20:a107:b0:364:31e:2cb1 with SMTP id adf61e73a8af0-376a7af61c3mr37840360637.17.1767339404917;
        Thu, 01 Jan 2026 23:36:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDHHkVWJbSGsAHhslEsC52zru/AGnwbaH5yblwxJ20t6Xo2iNxbN3ZFYfllsh6L6LLc/pugg==
X-Received: by 2002:a05:6a20:a107:b0:364:31e:2cb1 with SMTP id adf61e73a8af0-376a7af61c3mr37840347637.17.1767339404414;
        Thu, 01 Jan 2026 23:36:44 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c14747csm33863336a12.27.2026.01.01.23.36.42
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 23:36:43 -0800 (PST)
Message-ID: <ee09eaa0-1005-422e-a552-7fb4caa6700a@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 13:06:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: firmware: Revert kernel_boot.elf due to license compliance issue
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA3MCBTYWx0ZWRfX2X0NQufAho4H
 jaH+56zOLevXhUZfJrGyZ47Ry/5csp7+zezFPYAWvaEPd44q4txmc2lt/H/PDJdy8+h3wy0OpKp
 XbC/R8POMj3gpwPTsE9RwsM537mNXAZD817GcH6r//yLyGyHdyxgEvPTDlgCzsCU9+50m2S8uOs
 XJ3K0IXreCXZ4XGIaDf5RbDTKofxEFSCouI7vHch8OSnjdxXSBM5zAM6YCiiQfKrY1RR5rhNXsM
 X+G2oEIrbvGHwyVWhajUX4q/BgpLeRAndNhIO6MGtQgmmPIYSCqs2Ev+MO9NLRbqv94Yrk1Iqm3
 q3KZuYrgY4jfqy/ZwTBQT2aJAQisALZUWy/Wb547ULj+lB+sriXvLVOpi3Fguyb5kdn6HdKoAof
 HMLUARap/nZElOwC7SyJhUcAewt+lJNRw975ZRT3iULr3QmnojtsN8E1kW+wXFh5Xvpiz+S9vcu
 Xt66mmcxYUfydTeL6Lw==
X-Proofpoint-ORIG-GUID: wWoROyfUKq_cUIRXnMpZBtYr11gKXRG8
X-Authority-Analysis: v=2.4 cv=TdmbdBQh c=1 sm=1 tr=0 ts=6957758d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=o8htaDxf27Iiuzl_yU8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: wWoROyfUKq_cUIRXnMpZBtYr11gKXRG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020070

The following changes since commit 154800e885413bdf90b80b94e2e12f441be79fde:

   Merge branch 'intel/dmc/xe3lpd_3002/2.28' into 'main' (2025-12-28 
14:09:48 +0000)

are available in the Git repository at:

https://github.com/kishorebatta-ossqcom/remove_kernel_image_qdu100.git

for you to fetch changes up to d018ee81d5c0a7974660d5d07fa3c515593afade:

   firmware: Revert kernel_boot.elf due to license compliance issue 
(2026-01-02 12:50:18 +0530)

----------------------------------------------------------------
Kishore Batta (1):
       firmware: Revert kernel_boot.elf due to license compliance issue

  WHENCE                      |   1 -
  qcom/qdu100/kernel_boot.elf | Bin 49004344 -> 0 bytes
  2 files changed, 1 deletion(-)
  delete mode 100644 qcom/qdu100/kernel_boot.elf


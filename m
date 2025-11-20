Return-Path: <SRS0=C38d=54=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E85CFA446
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Nov 2025 22:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70568C4CEF1; Thu, 20 Nov 2025 22:29:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F413C113D0
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 22:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F413C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKKB4072050775
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 22:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=drSQvhEZNykxKDRQ0jZ8wULe
	zkE9tmYVyAv2X60JGYY=; b=CUfW69wGf33lc5OaENHsew8rCoG2yShq6PjJzZn9
	ICRFD5GIgKZrM/XKHD5Qn3GKps0hXnH0dP7PlTsC+24mxk4w5NpN5Pxu5fmhuwfD
	+8qjAIeJ9w+Fm1k+9Erw/X31PH1S5mMvKX1qToutuvbybv8cGQ59jh0TDQQfoyzT
	5yj1V79lfVVODluTLP98lwaO38myNonz6A+lxGMyVzfLFnfYQSDpZGUSCB9VkOQZ
	6G43dB+3kV9/scV2n/ZJ7uQzFESHNlrqvInJNbTgvVo3oO8pHZEMhEv/X3Z/Jlft
	wK6S36ZH4l0KNMFLyPtrDzfczMA+fKynkYd+RlIBKZ7ptQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj0m9t9ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 22:29:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ede679393aso37299671cf.1
        for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 14:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763677779; x=1764282579; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=drSQvhEZNykxKDRQ0jZ8wULezkE9tmYVyAv2X60JGYY=;
        b=NENPMJZBL2GJB4KSqSPDuEmKyybYxJuGja7Wp3KJ6moD6Z0bQxasbPajU1qXuDiDlE
         ox9lfOMAuzpCSK3gcAtWzglki0DWQVvujZhzzjbyKhzDDRoO6rLFE6rSkYiSXSK03tpq
         a4oqGuMJVvCS238uSQzF6IpDDT+FEX1iFcV2Lq+XdptQ/gcTjObUhPPqVWA/luOoidfs
         tGlKPG8jeNjGQhRMLZMRewzKoPPmAo80BQLmPh3XLKrVnXo+N7+yWwaehSAvKq/M6evC
         mtIxxXh9X3/Yf/r/TjBx/I4TdMYTa3gtufyWOGbRUecsrlHlrq/GoCQqG1czb8u6PyGO
         8Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763677779; x=1764282579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drSQvhEZNykxKDRQ0jZ8wULezkE9tmYVyAv2X60JGYY=;
        b=uweA5JES3tWeL+bkE61U/curNg4mGKGhwAchQa5DGJ7/hnUyNHmsxoRCvMs7HTCYCx
         WQrfirUCLluvurPNajHtg0tSFveKEKedMih7ww2rkbPl57G8sZl0GauyMHmEasSMRnUs
         PmyrrLAKv471Nez9H3+aW/kFx17NJO3ahESMwnWbsktW3kwzcUa7nWmrPC7b57egKvld
         8lrxVkzT6asqY909LTpiNrJ+wQEHRG4r8KvZym5lKZ8ush/O9rtJPJntifpxqHR82/aA
         sC58k7RGWMvknEVYcxfoQKwQjHH+Tf4Z/G578U3WKDOTmL7tuRLOCX9MmCIPVON0MgYt
         9C6Q==
X-Gm-Message-State: AOJu0Yx3JUk1CIc7e+7tmsMgd2JfyJsntP+BxS3Bo88QEhLrICg+qcen
	F1rrI7QjOtNcv4PY6jxngKEWMbWtsRZexm01eKjNMKS2KEHUTANiWJliqkg+ZvZyyLFgMjX+jZZ
	VgbHvpIfgjTCrJFbUsuSVFGDh2cIGXGxnoHEymGmFVDBNUy/GT4WgbhGqdoHONSQ=
X-Gm-Gg: ASbGncsMOMkJPElNfr93GnwZZdel1AXx4CUwSfWRu+G/ZTiWWDdXlk9yDWNczp38RfI
	646iITsp8VGJdPx1cslSHDTzpAnA+AA+ro42FU6DLLvkWne1aWg7gZt/HBp0/AghG0xYlNrwxkF
	Pw+eXPTfk882JMkuYYO8CTQJyNWfmOZceQPzErqJMoJQuneBuh/ppeZ/bE043CNQnM3a0i7QQgc
	lVm/UqGKmtIeQxG6nWmzQ12nmJ7I5fT+X1lsMurrS5kH3jszSTMxmA82pE4A7ZXMJt6etpXa0DA
	rfw8m3VV2GKDHMKsZ0BdfdymelN2JfiY5bPBBGO8ANgSuAV2l0qbbwSoOkqx7EeR8xyBB/a9vI4
	ninU8m2l0kqAW0N4J3ASbFizLR+BOFoervYWjoNQ7PLo95X+rDQFPh7/oHNGl5nlx2gEd4/AGTd
	G51YBKA1F8aXGz3xDfbyKtpoE=
X-Received: by 2002:ac8:57c4:0:b0:4ee:24fc:bea3 with SMTP id d75a77b69052e-4ee5885bf72mr4340001cf.35.1763677779340;
        Thu, 20 Nov 2025 14:29:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrc5FIn3A9WeLkH8XqeNUu4Eqlw28SlfwahPOz4vn4AVzFZQfmpQTEvc5ggwwF9EConQvRfA==
X-Received: by 2002:ac8:57c4:0:b0:4ee:24fc:bea3 with SMTP id d75a77b69052e-4ee5885bf72mr4339691cf.35.1763677778879;
        Thu, 20 Nov 2025 14:29:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6a9fb2dsm6824881fa.0.2025.11.20.14.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:29:38 -0800 (PST)
Date: Fri, 21 Nov 2025 00:29:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmware for WCN685x uart interface
Message-ID: <ylctfzbgxpnbitgxk2mwpw6aptdzyedscbvwm4dzsew2sskdal@tlyyv5bulpzi>
References: <5fd2de28-2bd8-4dea-9afe-0cd7a5d9c9a5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fd2de28-2bd8-4dea-9afe-0cd7a5d9c9a5@oss.qualcomm.com>
X-Proofpoint-GUID: fruR2EvhoSpapmjBU6w4cInvGOFFom1D
X-Proofpoint-ORIG-GUID: fruR2EvhoSpapmjBU6w4cInvGOFFom1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDE1OCBTYWx0ZWRfX67R8TbCkYITS
 goBCdOaw92o80e8yX6i69+md6GlfJLOMmTMpR4jvALIne7Yc7h0dDis5XlaSR2tfP21MUSK5I1W
 tgLZJ4Holew/h3x2QRqtZdODpCuAHTl0GcPqRx1fxBjL2/d8ktS+C6mt2xAxQL93twcxqmY/Nnk
 pc1nD0+y6ltHpIVleJr3AKIFu4BC/oEk+QM49v9OkgEfU17mpICGZF0eAuZrdCS0LnY3BQcI3vK
 Qu5H9+XgcECB4ms8PI0ZRMftyMIfF1HJHzlF5QKJowjy46V/fiELkwQ7IIyDdJo1yH/WhpWc23p
 7KwDkpevdkRs1fKnwfctKxeYCF3myAAA5Vg3G30VR6AzL1QT+JEk0GZg4TKANxYkqtML1/Aj8md
 ryoJCbNYYf2Pr71q2pO0PV9ozrtE8Q==
X-Authority-Analysis: v=2.4 cv=DtFbOW/+ c=1 sm=1 tr=0 ts=691f9654 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=wOr0ojEt5lRM0GWrwq8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_09,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200158

On Thu, Nov 20, 2025 at 12:19:21PM +0800, Wei Deng wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit 8b9fd78478acacccd0cde109b4a3550969f33bbb:
> 
>   Merge branch 'dsp-fw-kaanapali' into 'main' (2025-11-19 07:22:57 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/WeiDeng-weiden/qca_btfw.git main
> 
> for you to fetch changes up to 94beae96027761e69a54603605b8a9bfd7b71b3d:
> 
>   QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-20 07:24:50 +0530)
> 
> ----------------------------------------------------------------
> Wei Deng (1):
>       QCA: Add Bluetooth firmware for WCN685x uart interface

Please don't strip parts of git request-pull output. I'll add it back
for you:

 WHENCE              |  39 +++++++++++++++++++++++++++++++++++++++
 qca/wcnhpbtfw21.tlv | Bin 0 -> 152784 bytes
 qca/wcnhpnv21.301   | Bin 0 -> 6876 bytes
 qca/wcnhpnv21.302   | Bin 0 -> 6876 bytes
 qca/wcnhpnv21.309   | Bin 0 -> 6884 bytes
 qca/wcnhpnv21.b10c  | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.b111  | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.b8c   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.b9f   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.ba0   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.ba1   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.ba2   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.ba3   | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.ba4   | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.baa   | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.bb8   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.bin   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21g.301  | Bin 0 -> 6716 bytes
 qca/wcnhpnv21g.302  | Bin 0 -> 6716 bytes
 qca/wcnhpnv21g.309  | Bin 0 -> 6716 bytes
 qca/wcnhpnv21g.b10c | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.b111 | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.b8c  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.b9f  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.ba0  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.ba1  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.ba2  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.ba3  | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.ba4  | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.baa  | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.bb8  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.bin  | Bin 0 -> 6450 bytes

And I've added it because I wanted to ask. Why are adding both files NV
ramdump files with .NNN and .bNN extensions? The former ones won't be
loaded by the kernel.


-- 
With best wishes
Dmitry

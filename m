Return-Path: <SRS0=i9oD=DP=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A022CD4F49
	for <linux-firmware@archiver.kernel.org>; Mon, 18 May 2026 15:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42661C2BCB8; Mon, 18 May 2026 15:05:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4758EC2BCB7
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 15:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4758EC2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICFuk22700959
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 15:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zHSp6nRbx4aJtiA8eownaS4/
	up0NLJTa3Dbp2w3u0sg=; b=mUdsVkeE8XXfP6ihGKiBRql1ranSy+vZsInP1z4L
	Mppi4bn/rfYoADnECK3YfjBsx/fRbNekQR98xnfsPVp67HUKF9G6PAxULX0SmxAr
	uy1naxQHx5luBYL5/7CeVw0QXb0bROlwwbEV3XfWx7GzTFTehJniHkHq/COXGU2+
	ODbkjsP4TcKwnYzeBt76NEP/aPU53zf/M6vlLY5BXwN5nERENIfDqrbo0hXTEjSA
	YPF6QOeuZESvUtynGM42CKcY46D2KMaDeqd7Pxs8oq8QgzF58cOvqBGO+qOAlmEP
	ENYSMQ+xe68fRUboCZYgcArcbkWJ7m0/eMfUBtww0KqQcQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82megmud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 15:05:24 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dcde7bf859so6841308a34.0
        for <linux-firmware@kernel.org>; Mon, 18 May 2026 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779116723; x=1779721523; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHSp6nRbx4aJtiA8eownaS4/up0NLJTa3Dbp2w3u0sg=;
        b=GCBPgU0GYmTsp8bARcearir4KBUeueiRITwMVsNLJwrol+1mGBpkSmMrfrcoRaNCEx
         ab6O5d2HP62DxSjBX4Nt4AFJRxnW2KWiW2Sf1s80uNvvt11BWtNnJlFc3uD1v9IfG6R6
         /NRu5R7de4OZvERQLIRLYhTUkHK6NIJXBkcWf569EAe3A/QILgWBEQeGZVmaLydHNYSU
         OY54prsJ30xpkI9Ay/jIMq41TFKBWx9+aVQcR1wZK+aFZmvbY9GUChvvk4zibV8jpOp5
         lP90pFmouL2Hi78XJS1S9Fq4rno/vn5RafnV+0Clo1q6v6iaxKixpobZkLzg3kp+f2u/
         WN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116723; x=1779721523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHSp6nRbx4aJtiA8eownaS4/up0NLJTa3Dbp2w3u0sg=;
        b=m2IzfqpoVOPCVIx2fOg2O+y8HCy4ja0CUimo5UnLIeFAiBulBEnL+961uqBq4tN+da
         Zh510RycdE5UxghvyaMHQ33ZP+l+OVH+41/28L9qfndd+LXjVBLS+iTwLl/irphZMCgW
         B/SeduGIawj6XYtGWRaj1WvgHZ1AGMyD5k0yTYl+RzYYLyAqnW8SIV/B729B2glDTUd1
         NB99ojQRf5tgFda3QMRawORXq+aduKEy3Wkh/8X3YL1Ov8EaUSJy6nFYhapoJAK2erRJ
         bXL/44x71Iuqdu6BEQj13P/Qw58pb3L982ItEmDUDY8pqwB7G9d1/GCq5A9UolIBCUY9
         hORQ==
X-Gm-Message-State: AOJu0Ywf/vYY58NHfNHyjoYapSsnMb8YBHcgaAF+gN9029z492TjwDce
	8ySdZs19tVCM1QVVqhiUOiMdVqxf1L3CIo57KAyLlxkCmMg1j6sb3K6kFddor3r1z1w9y0gxiQD
	VLpv+bDh1fNf1bQ+SHkm6/PSMD+fjgC3wNWWRCj7i1k48fxBXoSdyFFHXtfVaHzHkXwJNV/I=
X-Gm-Gg: Acq92OGGLkA6Ec5zStPIltPBdXYOQAqNHz4fS/SS7o3npO3HJxadZf48A4b8Qi4rds2
	6why97/0XtJ8gRM75OnSdvH+Y0yqhdVMDriDkK5d6HLUuVj0zKl+xB91CrKgryc/ut/xUs8JK0q
	oqEakL/N95l+1NL2yO0SzZEbXJIm0Kv4d/K+aGImnJQcu4XqjcPoPh38prbvxBbsNIeaaJ4Wx+z
	tcfiJoMRlFthG3xiB8BY9SpwadEaGOjIqYJYMqiJzz4tPFhhiG9Zuic/gCHZNGtXvyhJKLuadM4
	TyS9ceGSOfOwbOSPmyavdy1KW/18KOZ9U6nuEc7RNBlTgG6OLtyeSuk8mOa1Wsumi12UlLfMNIC
	0BdZB9Lsk+LVMV7bUfaLOFuJn/Ux35gEfCmATyHSDAsRYwHPaScHgokXV+wiJQ8j/5LopK0OkT1
	Bj+0pEbETz3j4M1GkaYUzb7d92u+jT3PUQ51CKVS4cSK6gAw==
X-Received: by 2002:a05:6830:6588:b0:7d7:ccc7:c546 with SMTP id 46e09a7af769-7e4fa091396mr10971824a34.23.1779116723333;
        Mon, 18 May 2026 08:05:23 -0700 (PDT)
X-Received: by 2002:a05:6830:6588:b0:7d7:ccc7:c546 with SMTP id 46e09a7af769-7e4fa091396mr10971791a34.23.1779116722846;
        Mon, 18 May 2026 08:05:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c806sm3383578e87.9.2026.05.18.08.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:05:21 -0700 (PDT)
Date: Mon, 18 May 2026 18:05:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: Re: qcom: add CDSP firmware for shikra platform
Message-ID: <x2cbw6fngetm6rvvqcljnrnzksgnlrlihuflznsacugvitec4t@imelhtmezgls>
References: <306f9b2b-b162-4aa0-85b9-de5146ddf603@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <306f9b2b-b162-4aa0-85b9-de5146ddf603@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b2ab4 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=IFVwyT9f9CfqvAYi2UEA:9 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: rSe6p1PhuIkFr15eeqZj4QVrEqa-3who
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE0OCBTYWx0ZWRfXzqcLWdxkUMRC
 pIA1mMLlPxnZ1TYZhbuOh9mziFRuMqtF8bDCaJFWdft8EWs3h7JUeg2CunkpaqzQN7Hlb31KT8j
 aWaos354P5KGB2IEIFvQqYfnXFay0MNxFxow0ZXJCg4LimsISig9cayHXsY329ChL5oLkVmhwhY
 sReNLHwNy+dgS6UJjcGgiyT5O6UWtQgR2lDMicD5df17p4qDkBswNvHpw7CeOBBsiCkxHMSYJ8l
 r5dPc0omZpmFbYWhyCG49vit/BjhPP06XkhX3wtiYW5uye5+fqKyn3p2+Rl+wlc5kPTGCtUp74F
 +4E6oCmJRGa5lYPdSuU/pF/hW1nFLy4t4nakQdqSKGK36mf/RDGCZk6JNypZNVRtfNtxG4Caiww
 B7WWC4OsSNCAOKauL5GS4229wFpFpiSqgwh/msmz4wyNg3QQb6x8vPU3NRpAplbPJkqrhLsPxBf
 Hn7uAyhScmvFoGKD9Cw==
X-Proofpoint-ORIG-GUID: rSe6p1PhuIkFr15eeqZj4QVrEqa-3who
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180148

On Mon, May 18, 2026 at 03:50:48PM +0530, Venkata Kota wrote:
> The following changes since commit 5b2bc2e7d14c56e14c59a3d6e7b5b0641dc45c88:
> 
>   Merge branch 'robot/pr-0-1778742898' into 'main' (2026-05-14 09:15:02
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-shikra
> 
> for you to fetch changes up to c2777935a177a9843e92d3dc34e75eef1e75e1f3:
> 
>   qcom: add CDSP firmware for shikra platform Add CDSP firmware for shikra
> platform. (2026-05-18 15:37:44 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: add CDSP firmware for shikra platform Add CDSP firmware for
> shikra platform.


---
1. Second line in commit message must be empty
---

> 
>  WHENCE                |   3 +++
>  qcom/shikra/cdsp.mbn  | Bin 0 -> 2614680 bytes
>  qcom/shikra/cdspr.jsn |  22 ++++++++++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 qcom/shikra/cdsp.mbn
>  create mode 100644 qcom/shikra/cdspr.jsn

-- 
With best wishes
Dmitry

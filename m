Return-Path: <SRS0=tX4M=6I=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54266D1266A
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Dec 2025 19:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CE3DC16AAE; Tue,  2 Dec 2025 19:40:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CA0AC4CEF1
	for <linux-firmware@kernel.org>; Tue,  2 Dec 2025 19:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1CA0AC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2GsAE0045414
	for <linux-firmware@kernel.org>; Tue, 2 Dec 2025 19:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ymqUFuKgkW+1ZVITaHJuQJuC
	RC41Z8npiwRYSjupMVQ=; b=GAAOUGu1pnU7oMhHYLNJ8fln9vIgFPletMAjmeHX
	QbhEfK3hCHGC8rM8nd1noR6GdRmnjM+Lvg4Mbtw8UOHbCMid4PhWIKaiaAord7Xe
	Nx0e/3SGxVgyrld0Us8Fk6MHaoJJ+HRbosFLlbx9kiXPVwuAxiK2R3YKiNcoXcbg
	LhGShHpD7CKJEMu4ERU7Yw+lSo1DkdXtCyu7FKHm6zJv8DFo+L98V8Di8LWTmGEP
	6nCy5AL/ZlBCrpgqaM5tB4hg3Ub+2FY+bMFCVignQJ+lgEFda5zmOE3WSVvKgPDh
	GhWzeyWT/TcdIm71ABLZd7MbwyoxxFHcYwU2YrBUmF76Bg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at41trh59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Dec 2025 19:40:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b225760181so687723385a.2
        for <linux-firmware@kernel.org>; Tue, 02 Dec 2025 11:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764704410; x=1765309210; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=;
        b=konZp3DsWB014F3ALHsg3whFjFYWAMU7nWOnz8AUy7EEzarEZhcwfc3I0nB7sEo/LP
         DH6n24+sfMAAx4D+DUQdcwulhi9KMXPKDQbGT8U18jQaRj061nUNV1xZ2fenJjG5T7TS
         Mrqu0K4+DTO+3IbBWvbptqsE/ifkyvTDfsdihPI9ePyZlDacjBl2B70HdGemWX3jXCh4
         fG8ostpTP46l/F4I10laXfJza6oA0WMGoxzfe/8vmSH0IQVuDGuHgpAOhEuS2zYi5433
         0XhgeFsylNXKD1JtWHym3Ke6PVkq8tRV6wlXDDKuKxon5aYP6Shykv71P/N6d2AM5Q7i
         RxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704410; x=1765309210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=;
        b=UteM12OTAemEpl5ulg1v+Eehfvy18FwtLzYyujnrjKU9l5VOlnJHMs37btLPhdluvZ
         1PGuBLHXjfxbbfjgZDon+A9mDOu0lOwbNE2UtxHkNAjJRH5l6DVh5ehVmtfXTBrfq8AZ
         yZcObGsfYs6oQwD6JNF/VaC2NMAnTOhz+nYUlt3KsSNnkDRX/23eO4xikUSqii9eWss1
         4EuxBBJkQ8hkrYKm0br6S4aWWm9F0jIHIH9CfYnjfLTas18GwXYEstfxubCsyTmKJOUL
         JSqX35HZmgRkDHozBcg6bpKgWNHJTg3iDhz+fGPNMzR8gjnanpJzthV4KYMjEVDrPUVk
         1FjQ==
X-Gm-Message-State: AOJu0Yz1HT1rL5/7J3iT0C4KdRA6gFGc/qiOT+UEf8XlP68gF4qhxvmF
	J6xJQpyDuDzSscDt4vrZuk4Fgke8Y0W22gvyzGuTLT/apKiAJjdFxjDgP0QvrgdO/ubWVifdT/c
	0/vAH2ssMNxdjo6Ifp4gaRlrKCmblcE4Sg+zWvT6su0F3NN2X+G9LfKZSuVd6njA=
X-Gm-Gg: ASbGncs9JS0rZdEIkVJyrxHqoDnUOJlNDfZukYXFrT/TlA60Whl1k4CuxtY+KJ02Cqz
	V6LuyMv51IL4OxCeCL5MXz/IuqgFAcsm/8yllT03wZJlYPkJHbAy9hcWSJheeKSDgp6CJl0YiKl
	sW1a8mIArgVcA098YHtabwMThLRKBwnkzZFI2MKK8mR+KF27aZTiChfxyab/pzjn5APV3odQb1v
	X/HR5Ng6yi6sXwCrdzxBDGidtFL1fvckSELmKowQXuetgnCJGYCmyHoBzpg3i2g9DPKnm3JbS23
	iPNwGTKFIKF00KUKYuLeIoOzjlb+enkNMZiCl55zQ5a8i8ZIVyWjmcR6D9jbR06E62rHFYGVT2C
	px4JzoRNqYFjqjouXY6ehxzTxytwuhzi5EiHzmF6SGQ/p+sRkxGPP6enJ/wQXeZCb6rhNaSBgIt
	cmZPeKBpzjePljlf+Ufr0V31o=
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr4219787585a.6.1764704410193;
        Tue, 02 Dec 2025 11:40:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeduTZfiwuLmEI3ux3Yzeal23XZK+cH0bfIgKG8RjjcKOtbLOA0MsLVdr+HitBOBcoOQR5QA==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr4219781785a.6.1764704409657;
        Tue, 02 Dec 2025 11:40:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7d0asm4967858e87.11.2025.12.02.11.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 11:40:08 -0800 (PST)
Date: Tue, 2 Dec 2025 21:40:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20251202
Message-ID: <xznwi36wauarz32zf6fzxug5fxpu2dd2de4mgnwoxbwkyanjfr@f4fwq6jtxuyr>
References: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ebswvrEH c=1 sm=1 tr=0 ts=692f409a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=9XiVC44GTZ18DIIRa0kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Ge8jbbwVOsqWI-vgcNzqL8sB57ff-mMR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE1NCBTYWx0ZWRfX8OAua+3ChThc
 iSkJhFi4DeZgudnGNKlf/LSsQexFmd56Dlo+Pna4VWYBCwzffm0/BiRAnex4bjnpsruSCi7shEp
 +X7055YMzfiAkOjgjnGHmfWM4o2yil2il2t7x2D1HZT3Z+ph9qStYxSzd0GqjFaQQmBo8Yi4jJi
 96ytR11yXIy9kR6LVMMup8ra2gzOrItpl+15rfEBTN4fut7ySHhZpF8iCCiwlrDmRDJkvcm2Vmo
 p+1FI5Kfg1s4E1zI3oLODN+p0LRSu0ewz+87dSufp5NgPP8zsbhhUHyJ1NJtsXQtj4IDNDmNW9w
 mDHBslCJha6pu9BdTP5sVgoc/1iYJn+qCWCgkCeGbT49AiEohYFumnWTS+uVxidogt75bDXjRF0
 NZORUg32BdFEmMSrTPeJrcFkZeR3lA==
X-Proofpoint-ORIG-GUID: Ge8jbbwVOsqWI-vgcNzqL8sB57ff-mMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020154

On Tue, Dec 02, 2025 at 10:05:38AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> Only ath11k is included this cycle.
> 
> Update the board file for two QCA2066 platforms, and update the firmware for
> QCA6698AQ to enable CSI/CFR reporting functionality for IOT products.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/814

> 
> Thanks,
> /jeff
> 
> 
> The following changes since commit 38c82f07a964e27c3e71224c1f038a4083ff58b0:
> 
>   Merge branch 'robot/pr-0-1764573234' into 'main' (2025-12-02 00:54:05 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251202
> 
> for you to fetch changes up to 15f8543684412387ebfc97a4b99ecd18afdc5e0c:
> 
>   ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-12-02 09:53:54 -0800)
> 
> ----------------------------------------------------------------
> Jeff Johnson (2):
>       ath11k: QCA2066 hw2.1: update board-2.bin
>       ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
>  WHENCE                           |   2 +-
>  ath11k/QCA2066/hw2.1/board-2.bin | Bin 745408 -> 745440 bytes
>  ath11k/QCA6698AQ/hw2.1/amss.bin  | Bin 5005312 -> 5083136 bytes
>  ath11k/QCA6698AQ/hw2.1/m3.bin    | Bin 266684 -> 266684 bytes
>  4 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

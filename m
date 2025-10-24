Return-Path: <SRS0=6tLm=5B=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC89CCD1BF
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Oct 2025 23:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46BA5C4CEF5; Fri, 24 Oct 2025 23:54:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3EB6C4CEF1
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 23:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3EB6C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9iXM010025
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 23:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITWMoTx3SRDfQIahX+uj7TZ5k5AE7jity68FEz9loCM=; b=TnB3R6UXWlVHoA+3
	vj1nxdDtiQTMhjB4HqTYEnhtNaMt6o3YCAjxW+GvIFr1kyikqUcI0eOW9t/KAfbg
	E+PfZD/iPzijPl0O4TwdnBDnAH3qW94KUYCt7cp0YhrrVVamtqSaAwbreSy4SzEj
	Z4ERQ9E+buJgxDvV7s661cz4t+9ttMWC20dfp2ywxN3nJlI9oqC79U4q4G5q/4bw
	UYAXw8WARsXq5E3Rr7GAyralzuGOzUCze7L4IczDXGkP1J4+bBJwEMufCir3WgFj
	WdX6KbPGRqczYLn3BWSlv9854Liq53q4VsLovWrEvuCMVJlGO9Dfm5pVyi0E5QdZ
	2zAMuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gedg6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 23:53:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-890f1090e44so641661785a.3
        for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 16:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761350036; x=1761954836;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITWMoTx3SRDfQIahX+uj7TZ5k5AE7jity68FEz9loCM=;
        b=C2iL0dZDzI31jQY497HcfDfRKyURLnol0FFLH8gdAjvntrQ+lh/Lsr/Yd1r6JTM4vn
         Upf7L6ygbao+XXQ/gcWmgH247tpLsQm/5k9yRKof3yMyLpNugztVfrv/E86/6Qoo4VEu
         CoQe5SDDJkM2XMe2YcaDwawuBV+ln9W6VRWxO94hPinPYdcK4Wvm/4xGTCznvG2tFrp7
         L22VKYcaFJcjXmgcG/KMM9BwI7QZbIdNH5hwQO6RfFRAB4OpbhwtvV7tBbNcdwVvYnK3
         q7N/KKFEbFleRHuzJySuwGRf3O+t7/ZtwOOIa+sSrA9yrA/kq4i5I2uaq3lfn3/GXxyX
         7GPw==
X-Gm-Message-State: AOJu0YxC7E3w/U3gj2Y8E2eK3W+IKwom7LxvqQSR3o6sq1jrlxDMA0Fc
	L4QyZp5QrLYLjboFXmRKlhTbz7YVXzndKUk8NvrTg9nFC2R2oKvq91YKS0UMeWt0tntt0JfNNle
	QaGvkmJEJsX7wm/G20scSCpnemTkeyPde6WiXlWs6/fRssyfhqgfe0Q666O3Ammj0MtLa5go=
X-Gm-Gg: ASbGncubLsMOvvFNL4dDx5GlaGZXGXZBSPNjTE95z2eGnMyb0SX5Jr8k01FYcs4C1Sh
	AbLxBiH7dKGWNgTXWruL4IGH6jh1+JkxrOZ8Papy6wlL3UQsHa44YmIveA/44GCREyP6U7VTTSj
	KZwiSF1RPNvbwuGqbDdMBLRmuaM650MYI2TTFdFLYmYfPQRLlVv/J77PGz44HWHb/GR3VigYi97
	7iTeMDL2QD9Gs+rhD77AI25dx03VwSFQ480dveFlcGTRUY3affr0zl1J7YrP2jy2iRh2Xc4TW1F
	DLqAAXNDT6GnVsLjVeor62Z1cmD65GRDcxIuDoFhamgfjRZgoDuvTYjoi1rWJ+ygosDSt5cnztG
	QKTDTznjX77++9FZsFqXY3zv1NjRhqkt0tNhJxXOPLY18/g+lc2YNcvVxszkI2KM7mBDBH1JrP8
	mBSyYNNqHUaBT6
X-Received: by 2002:a05:620a:31a4:b0:89f:52d:8565 with SMTP id af79cd13be357-89f052d88ffmr136024885a.79.1761350036444;
        Fri, 24 Oct 2025 16:53:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWOBEMnxHOYzQUK4fqv6c7m5eQzwK/y8btm5q2O8mLDstAIhdYfTVe2wyW5+eRs4f2aCCocQ==
X-Received: by 2002:a05:620a:31a4:b0:89f:52d:8565 with SMTP id af79cd13be357-89f052d88ffmr136023585a.79.1761350035976;
        Fri, 24 Oct 2025 16:53:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0da29fsm1802211fa.43.2025.10.24.16.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 16:53:54 -0700 (PDT)
Date: Sat, 25 Oct 2025 02:53:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add ADSP firmware for kaanapali platform
Message-ID: <uxor23rawgpp2taghle77r3hv6plwtz3ocuizuex4dgmih4zsb@ayndtbc6wlky>
References: <3f667d0e-4262-44e6-9615-d5b5efc16197@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f667d0e-4262-44e6-9615-d5b5efc16197@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX6cQIEzB36BmI
 UdNByqEv7sjb0GZI5aVDq8lPjRdGyfM3sDwTAmPvmYgDUiNnru9cPXJVfbGn4cq1v1Dy3brTZJa
 H+nWpWSV+HZUSRRKou5Nk6k52TuOISuk/iUgM8Kp7mUHsa4b4exCCgl1SvyAFvAkLH2Frc3ohry
 gTiOg5IdGO/5ex1DNLvfkMRusiEQmKohef74pCgMjMlgLzxX1tNRkwRFDS+r0YlLyIv/VXDrfoT
 LkIbxa0D7KEC3F6PKCUn0/Df0tdVf3BJ+Aa06fF5mvlwsXCaCJbCezGAmL4wpiqcRrGShcLjXFx
 W1A4HSBlf6sDuaabFr+3R0VB2S1MNa298uWhsS2CO2NnPCEMOowG528J1Il4vzVO7Wrwlcl1OFT
 WIE+B0GfpuU8XeIzw7ESBDiBOmh6jQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fc1195 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8
 a=cwXaz5QAoyVcqKotz5YA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-GUID: EEcy6U_1KDTWLYT-78P6VlCadl-Uno3K
X-Proofpoint-ORIG-GUID: EEcy6U_1KDTWLYT-78P6VlCadl-Uno3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On Fri, Oct 24, 2025 at 04:14:49PM +0800, Xin Liu wrote:
> The following changes since commit 19731a36222e7b1ca09be090a19bfd89640a837f:
> 
>   Merge branch 'HP_Linux_Firmware_20251023' into 'main' (2025-10-23 13:30:10
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> 1024-adsp-knp
> 
> for you to fetch changes up to 120cdcac887b65c1f259b345ad107492cbf597b6:
> 
>   qcom: add ADSP firmware for kaanapali platform (2025-10-24 15:46:14 +0800)

Merged and pushed out,

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/760

> 
> ----------------------------------------------------------------
> Xin Liu (1):
>       qcom: add ADSP firmware for kaanapali platform
> 
>  WHENCE                      |   7 +++++++
>  qcom/kaanapali/adsp.mbn     | Bin 0 -> 19879944 bytes
>  qcom/kaanapali/adsp_dtb.mbn | Bin 0 -> 184120 bytes
>  qcom/kaanapali/adspr.jsn    |  22 ++++++++++++++++++++++
>  qcom/kaanapali/adsps.jsn    |  22 ++++++++++++++++++++++
>  qcom/kaanapali/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>  qcom/kaanapali/adspuo.jsn   |  22 ++++++++++++++++++++++
>  7 files changed, 102 insertions(+)
>  create mode 100644 qcom/kaanapali/adsp.mbn
>  create mode 100644 qcom/kaanapali/adsp_dtb.mbn
>  create mode 100644 qcom/kaanapali/adspr.jsn
>  create mode 100644 qcom/kaanapali/adsps.jsn
>  create mode 100644 qcom/kaanapali/adspua.jsn
>  create mode 100644 qcom/kaanapali/adspuo.jsn
> 

-- 
With best wishes
Dmitry

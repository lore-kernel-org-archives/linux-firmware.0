Return-Path: <SRS0=49rf=DC=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29B6FF885A
	for <linux-firmware@archiver.kernel.org>; Tue,  5 May 2026 12:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CE27C2BCB4; Tue,  5 May 2026 12:27:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFA42C2BCB9
	for <linux-firmware@kernel.org>; Tue,  5 May 2026 12:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFA42C2BCB9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456HH4C331125
	for <linux-firmware@kernel.org>; Tue, 5 May 2026 12:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yr7KKDOtbodIc2v7gDyEPuKh
	6t4/JezAxs0SNrnCyz4=; b=pF6Y/VmxDMia8gn6sm52jUo16iQT0SoTn9EEXgZA
	IJEllZzb0DzfBw2uIxBBhbh6QkHXW3MEnlj0mQgTop/j8m+9RZECPjMwqUhIcN7N
	mtnkyF4nNQatZ/G01gHdKOyB0C6RcDu39tUPETdgRRerl29UpqN1YT5yetPIOg3B
	X6Bvmj/3f9p5dkiyKadOTbK6snWzzu6adxg5rb11aNFomByeqFzacRvRLzeQRMaW
	U4sleN6o3g6OnIB+Lx+ZrTGTXRMaMIgYrT8sbKyvylrl7rUGzVkKtjGeBCoIoRWv
	RTO9mODffRdWhS3YwmahCLrw4d8YY271MyunJ0jhuBooxA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1cdth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 05 May 2026 12:27:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so146334961cf.0
        for <linux-firmware@kernel.org>; Tue, 05 May 2026 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777984055; x=1778588855; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr7KKDOtbodIc2v7gDyEPuKh6t4/JezAxs0SNrnCyz4=;
        b=Se7G1RcOcUcB6SUKsT25sdOLUVRTM6HqMEq9sXIV08mu9xLGT/AYBuDpSS2zVMFpU5
         HziAKyaEQpFUXRTACwuu3++WhHvW9yWRVy/e7h0W231ryP4pMASQtr2ieOEkXSs5Tnqy
         Toh8pmknYz+NiYLcp4nLzMe6XVAn5j7QHgrWSCUbeFNwK3KCWRzdtlhagfJVYLvNVnaN
         WNMSO1fJin+YVkiiyYoTSuEM78p8hDwngcxb4gPfqLouYGRoqXnieZ2T0dDaMCM6C/J6
         y8D+MtHj2wrLXuVvpuccf4Ceucfk6hqsF8py7nArO1prpqQUrYdrQBzTuvEcl4zx9j/M
         +WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984055; x=1778588855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yr7KKDOtbodIc2v7gDyEPuKh6t4/JezAxs0SNrnCyz4=;
        b=V+DVjMGVbUC10/losVfQkOBD+19+8hT+9LaigZVd+ZQjd4+fWA8TJgnJtr31oxtPzs
         788XUd8z7FruopJzKjwmRijK7QIw7+DOkvA+4SU02NDLpeuSiAm6ndlSdHyEG05GWW0z
         wnPgooIPzclDHtGLx+aux9MfThRJTcTqKeGqgFoVLWcLoCiB5l+BaEknpaHoFe+pMCqX
         mnjLDHslDledqqj92ZyGqjsc7tUQ+PxTZVCyaF66OrsrgTOoyAVcqkJZcASFFGe2h7Um
         JRDTWjOG1sAYKQzwtZfj82QllAwmEGQwoT2RONgVIfo8DRejBAGHstCxPcZ3/QFYaWmC
         JnTg==
X-Gm-Message-State: AOJu0Yyi9MGXJnJjj4NYhJEnlls+eP7/0ZJShkCW9Bc7GDO7CKv+S1pu
	5NlQYD4iaVC9vD6QMUDywWvJEJaHFmAw5xyV4dR3rUGCJi9fZHgPQRkBBNxE4vrT2xux5rg1AN2
	Pkl/vy1nqNFkl4WR3YXavhf4DWnknR+LjHPjWckRrchNBLUvZNbtmRZWmKjWKn5s=
X-Gm-Gg: AeBDieua2kcwdETyKcTIHunHvfUGa6zPD1wQpy5Hn2I0oNZ5zXNT8xjrbb4APuOQanj
	HtTEQ/1JKJ0vplARFN7Z2SnWekJqHFJG8Cy1BYtwneugT/DYzMhuaX2oPCePvhQNiY+Jellehiw
	Blw7D2j1+ozeD7C2kDVjtvXb+dTK+kUBCRL2dT4bmKTJRlQQ2TUC6ByVsbPnkAY2y53qEzReXls
	2ucQ7XZdIHDnbP8pNN5SjcfIGCfEpFrO1IBTe9uN9mVueE9BA1oyBfek+z7mfYbkV1vHqgcCv+V
	zNc5A0cF5i2b6RxhQ+7yuVBdA7p4MzXBgfHUlmmMf4oWumqzchfcXkZ/f1HI9LhT1OsPQXSa8Bu
	dOWfuudwtAECDd1/HwCCN+QqlaaAKzXWy3cibHIboI7fUhwX9ENMGo+IHOISCykpXO+IKAYjgke
	DNoDdaVgsYF35RtGtpQmrqvDE8vUF4XsgJil4uvPellgmF/A==
X-Received: by 2002:ac8:7dc3:0:b0:50d:83de:4933 with SMTP id d75a77b69052e-5104be23797mr207531091cf.20.1777984054831;
        Tue, 05 May 2026 05:27:34 -0700 (PDT)
X-Received: by 2002:ac8:7dc3:0:b0:50d:83de:4933 with SMTP id d75a77b69052e-5104be23797mr207530691cf.20.1777984054350;
        Tue, 05 May 2026 05:27:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86c7a1698sm2478191e87.3.2026.05.05.05.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:27:33 -0700 (PDT)
Date: Tue, 5 May 2026 15:27:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zenm Chen <zenmchen@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, max.chou@realtek.com, hildawu@realtek.com,
        pkshih@realtek.com
Subject: Re: [PATCH] rtl_bt: Add missing rtl8761a_config.bin for RTL8761AU
Message-ID: <rrjzmrns3gzdewpv7fk5fsvso7d4xpn5eytenuzv3d2soaaav7@cdbtbszfmoaf>
References: <20260505071341.7688-1-zenmchen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505071341.7688-1-zenmchen@gmail.com>
X-Proofpoint-ORIG-GUID: iUzAJUElYjTMztGA020yGYekeDIR-ZtS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExOCBTYWx0ZWRfX79aRGTq+65b4
 g6CU3g56MNbtPFM37b1BbhqIBkF+mEQRQeF5UqDDm7vw7MQK1ZdLH7VwLoI85XylLjmg4lxjMuO
 z1OlsRh6ts1r3fr8llD4vx4N0RUj22s9PR3T7tFm6U+vuYVuqHPmrH1A4UdBaMuYLangk7WLXIP
 NGSOI754RX2Y2a8isOaxy+3dBdUU7206fGKjyixtRo7Wo4+HunZQlhbbBF0052TV+gkE9CiLsNV
 39OPZ6ww7bUA/kqwNefg+DLocYbTO0sxbvKnF8MkzoQ3ibEStMP2Fs1royB1qlM+dxOI8AZLdk4
 P2W6O9+RsVTKLPGCVR6Hd2/TU3mIwSxG2MyvqHNL2ghLT/OFCUf6jlbp9ZGIK1lbhrGuvaavs99
 /WOkS+EJ7o+4B6M4eT0S7NV9MdgDasi0Utf5lslMHh7mEVejm+18W/cxxVPvEsmQoCaP0JmsiPt
 XJQOiOpfZpfP3CYke/Q==
X-Proofpoint-GUID: iUzAJUElYjTMztGA020yGYekeDIR-ZtS
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9e237 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=pGLkceISAAAA:8 a=BH75t6FrcxBGqt610xsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050118

On Tue, May 05, 2026 at 03:13:41PM +0800, Zenm Chen wrote:
> The RTL8761AU Bluetooth controller functions correctly but there is an error
> like below in dmesg because the rtl8761a_config.bin config file is missing.
> 
> [  171.949697] bluetooth hci0: Direct firmware load for rtl_bt/rtl8761a_config.bin failed with error -2
> 
> To suppress this error message, add a soft link from rtl8761a_config.bin to 
> rtl8761bu_config.bin. The latter is an empty/header-only config file
> compatible with this device.
> 
> Signed-off-by: Zenm Chen <zenmchen@gmail.com>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1031

> 
> diff --git a/WHENCE b/WHENCE
> index 48c471e2..f7fc4928 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4395,6 +4395,7 @@ Link: rtl_bt/rtl8723bs_config-OBDA0623.bin -> rtl8723bs_config.bin
>  File: rtl_bt/rtl8723cs_xx_fw.bin
>  File: rtl_bt/rtl8723cs_xx_config.bin
>  File: rtl_bt/rtl8761a_fw.bin
> +Link: rtl_bt/rtl8761a_config.bin -> rtl8761bu_config.bin
>  File: rtl_bt/rtl8761b_fw.bin
>  File: rtl_bt/rtl8761b_config.bin
>  File: rtl_bt/rtl8761bu_fw.bin
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

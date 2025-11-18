Return-Path: <SRS0=fUOl=52=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A510CED606
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 10:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 321FEC16AAE; Tue, 18 Nov 2025 10:58:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02D56C4CEF1
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 10:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02D56C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQmSD2926673
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 10:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nq2xpauWdTSgQ7rE7bu8J7sw
	spL/KOTxh8qPSNa8dNw=; b=OBxd300iMJC29NN4pqpYHicl/hLtyRQVLnMZNiga
	7AkrZfugJQqv4I0Z9zuZRkwuGTWG1qmldicNtu6DPgaPy8iREYwaLCyL2KJhZ9w8
	A8zQPKELl3b/Q7G4yUOayuZGer+It6tefXorvikkZcFAM7qtWPUoqsLVkcZyxHMh
	tjfsbkgexlH58sFh8/G7ncdsv0L6bw+bzoqNEQzALCVZKK/966JByBDzpCh3ckQT
	J+/EHKN7kNbaQTnj6zFrdBvLs5hWRWqVm0xlrLgZiFLDlFLBaAWUhqLYtg504mfz
	cEsnESpROSLXP/8MtqV6ROiXfEn6IIBpm9ckHneAH6Nn9w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq2902hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 10:58:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804823b757so192104576d6.0
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 02:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763463517; x=1764068317; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq2xpauWdTSgQ7rE7bu8J7swspL/KOTxh8qPSNa8dNw=;
        b=bnqoDkQm0TyUIl49e6Jk0PoFE7EcQAaeQIPd7nn8zJDQfSpbqpQAp9873ib+bCQ+jY
         voLsfu21GoaNHqEhrsQt2Sbltg4DCteF44M30ttq2/ScDuL3TJ4GRnZhdI/lSb2a37Sh
         FK0BJv129D0HGWtZgD3Uuy69Q3ulgRbMsb5O/vJS9SnZ0QJ2Nff554CkDIYco/sfItOK
         KS9WGrnT+VbardCWXpz5cunj4bp+B0npKHvt7dz4xicwOCv6pCc5mjpOiKolpUWGo55O
         Mw0gTjVIdpyFabOBJ+QCnQ91M/0NSFH4eDpMbXn4L4thy1d8TYUKDuU6h5GplithVcgB
         6HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463517; x=1764068317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq2xpauWdTSgQ7rE7bu8J7swspL/KOTxh8qPSNa8dNw=;
        b=Hju3gHqqs7dut3+0fAumV9iuo5W2+47HpI68fTEmQ7LYiT7kcLfSH6F3tWvlXme7yk
         7kGJB+JUf6VL8xyu+Fr5UyUP+0jcwI6FcBvwQTRM3UgtK5r+KVi5dfdXA21UV1cbKggB
         ReylwWhOxKx3x/pViz/mcE9YsEWDiFZ6j5Dva0i0+n6AUQyGQgbf5De6kLgr0NbahDyb
         B87UNPj8sRYabWBHKZFTgJVArSn/I6XsRT0I6banAaIyb6nrSg5qRBL9VSMlhc9VTHyD
         KqIlxMmZUMRHujGv/q16bp35W9snFSScc6T6woY1ybTY36dGrcVYCEhNwg55sQ7dXSN0
         Iv8g==
X-Gm-Message-State: AOJu0YzPdVKTJNgWY5o+Zd8CETs/x0nnYxv4a6b4TvgTacs7uz6Q5jXZ
	XpunFHkH1kNNhcKOVYuYnN2fqR1RLort7Jm++ciTCH6+mOF/0MoKgN0ZCUIEaE3S2ifPOpOsZan
	LkQIZL7RcSPi5m4kR+5CkKLJtE6DyRGTheSc9UE2kKgwIfcIHfKKO2+tvtRA6sdU=
X-Gm-Gg: ASbGncsT5llxvUFv/wAaDb7tqlAH4sLxA9b+0PHXWQrc4konTLcbgHEcNM+xBsJaNKE
	sQuzRzOZG/09K7MuW9RuCJe62EavvhEaOCQn6aDkqdut4VVqbgOncUWrfzYN/bBZkgacDeho/CU
	L1VDRnQz1IPkHucUPCLsSd9msRJWuLD2Dzk2oao81TM63SejuaupOMu1NMiR5Svt8OI+LOBnwZw
	bgqTYtfAgTCEHlhxSJVw2j+xXWAqTEB1gh0/8t2824IGhnhGYP6AGMR77E6wKALEJTCfZOdP09D
	sMD5v+kLim48Cu2ge68qJ+2UtezqXbcQzUEuG3Eyk+GpEBSEyPFcsoSxHEw02tIAppKOSrvtkHp
	ix4JzsjVRnNdSbGvpRZ3Go06eM+NXk1V5RVpm9QsuD2ae+9Hix8Q2Ob+j+gMF9fFnpN8o2OBkIi
	EwumgOH0StJtQl
X-Received: by 2002:ad4:5f06:0:b0:87c:2095:c582 with SMTP id 6a1803df08f44-88452afd7a5mr42420706d6.18.1763463517210;
        Tue, 18 Nov 2025 02:58:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCyYd+u9ZPeRY3xV0mGJ5TKHOuFAO0n3hJ+WkPN8TFU6XIOZCMuT8HmUGS7RhlFmuha6m9XA==
X-Received: by 2002:ad4:5f06:0:b0:87c:2095:c582 with SMTP id 6a1803df08f44-88452afd7a5mr42420436d6.18.1763463516791;
        Tue, 18 Nov 2025 02:58:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac90dsm3882228e87.22.2025.11.18.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:58:36 -0800 (PST)
Date: Tue, 18 Nov 2025 12:58:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
Message-ID: <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
 <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691c515d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=_vd73KmtHBvxkLtaXLUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: tPUMbbqwPDK-ZpyCftitNyGnQa5jiVqr
X-Proofpoint-GUID: tPUMbbqwPDK-ZpyCftitNyGnQa5jiVqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4NyBTYWx0ZWRfXyd05f256M4kR
 6stg2ZHqgCZDmnSvNL3+ll+OAZatltvHdmMjcezaBLXuePkblTRcm6hFfm/KlVxthCwcT0SvSYY
 bQuB+8eASBNJq90LT2cHlfspFIsx7CkXi9/HO6z5z/6pF+j3IUCy19hkOAUb2Qps9ZTaMDiGT2X
 VmdX+1Tm2sR3VfEZADylqfpD1s/jZ9+sxiTT/3qRN3NjiVR/FQZ+D5HBW02G2tOR/PNmC4cbL6S
 ZYvw7VAUYGiDqvJs/VrWfWZWlQo5TNv7AHC+t4rCXXInvFrX/y9zUHMfpJjllWKKcjEpmKuPymt
 9MTUiDtA5IJtDNCfHv6YZ0dvMhJwrcsJ8+WdSynsRgzr2qkZzTS2oFsNCM8e1jwz3+QrSsBeX5G
 xxGRSK5P3cih+6jd2ToDxZMqX+oEdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180087

On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
> 
>   Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-kaanapali
> 
> for you to fetch changes up to d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
> 
>   qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
> 10:20:00 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: update ADSP, CDSP firmware for kaanapali platform
> 
>  WHENCE                      |   4 ++--
>  qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
>  qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
>  qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
>  qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>  5 files changed, 2 insertions(+), 2 deletions(-)

Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?


-- 
With best wishes
Dmitry

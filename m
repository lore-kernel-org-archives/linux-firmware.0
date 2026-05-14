Return-Path: <SRS0=+dl+=DL=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB13CD4851
	for <linux-firmware@archiver.kernel.org>; Thu, 14 May 2026 09:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1414C2BCC7; Thu, 14 May 2026 09:15:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BCB0C2BCC6
	for <linux-firmware@kernel.org>; Thu, 14 May 2026 09:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BCB0C2BCC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E35KLO1096436
	for <linux-firmware@kernel.org>; Thu, 14 May 2026 09:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9CjhhWvJ31KwdBRxPy8rruL1
	HOa7AyVbyIOrcQPZqOc=; b=NWL2uWig529+ojv3c6xzmBCYDBPPkrNDMWfSkP2a
	StsHMz3KT6s1pcc/ykzEPMV2Ta9TkZjmk6jV80xOQQkoS2YSPy6bR9l9O+cn3cZf
	BTMZG1ZyXTV4qp7He+npAGDHZOgvkVg7eWQ/xbiRejOv1KVehaRE5HY2DaddJFrl
	cxLz5e+K2nBTjKB6aLDsy0oK4UVWLmmy9G/7TrRA3pILPkG6es2dLCUrX3uLJhTf
	vteiOefgkeq97actXzOSoi89afA8GEIl5fh86M8w++rF6VedDeQK+2L8/cwd+WzP
	12kCsfx7Brz8FnQnXfNScpKYoQI2lOaOZ+WoEfrRgM3Agw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bh55a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 14 May 2026 09:15:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b673c8f1so72853121cf.3
        for <linux-firmware@kernel.org>; Thu, 14 May 2026 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778750136; x=1779354936; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CjhhWvJ31KwdBRxPy8rruL1HOa7AyVbyIOrcQPZqOc=;
        b=Q6KzZtouI8XDj66GZ+SwxVePBkxGX5GT9dNw75ZGTWAh3QIGwoAbj0KTOwcEUKhe7l
         xFYOYaj/mkOeUAzxVQu2Ur5UGoIPURaOWhD0eg4VF5OSyfMNGutJjD0o1tGbN1vdTYMo
         Rk8cvwRfVL9Koi97c/ySQAP/kISzm+Z3Blv+yoAC453OOoLubpcKjWcB0c8LSIqgyKE+
         xcZbswmOd9ano3hEKzZPC6yWu+SObNTfFV5bAbjPtZqhCUbNXYHpllVSEFQayNNN80qF
         xNvVzm3ZTYe77SK5nxxSIx1tnI5p2FksOa5s10b60OgWu5JHDobQdznkepjt0RHgIHvg
         gTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750136; x=1779354936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CjhhWvJ31KwdBRxPy8rruL1HOa7AyVbyIOrcQPZqOc=;
        b=E0SvOFBJRZjoneHzmziffBATrhurbZ7D7r7JNZ+k2gEWCjY7Sr0kOt0KfKR+ZsnI30
         WsR8H2FBfHKEeTbN/xjz/kW82K3S6tDQ9AfBtzpVDoLxjv5p+KRzQC6sac8XwPblLYOR
         yNXtldAYm+viTXWioETJamHqzMYUtfoAug/C5tnKXNS5ysC2IIsTvt/VVRd0OjiheAhY
         JsCaMWfE9eTl1cTag1fNzL5FMCigfomWAUMCvyXG6yYXhfrLhi/1RsoRRQ9M1xgbVzy6
         GBvdU81R3EmcBYAyvxADNrqjX9zGNymCAE0l8HPOlm8VGGt1xhDrvdsRh9gEQDSCSVYI
         NCSQ==
X-Gm-Message-State: AOJu0YyD5DC0ufSNRoZAEJ8hl8yJXXZ1UJE74JS23lS54GOInwvqAZHk
	+2aO5NA84Ql09rqZf2iU32t7H5rjUaoFqiOicN76y1Zy0owjHY9KaMcZd6qfrtm4DIHhpnEpUcW
	CKb8KoSyCZ6ADFVcjI84sMSBghHbetgOn9PCCJ890uaJYHqWVZ/hBV8t+JfrNE0w=
X-Gm-Gg: Acq92OHf5uoghzVykfpe4apPTrqbPFG8l8hvLwMxpBq2Fb2Y8TDKm6Mxa+AsWCXrOEn
	T03qhVh9kR4ew0L1ID89fXt1iRx8ahUYY6zaTx9/ih5GtlZua6Wuclqz+hIEFvgbTEtjPFXWje5
	OXvRJgBIOizLdZyOuW+k58txBWaY+/W1W30ujbMGZ3a2UYBNQQ/6jXIX6gzAhgRQSKC/PQZ+KcR
	tgxp5kgWF+hIRzTJoAzwT+z6UBieqUFZibPPPdnbJgmPDsfvLvH0YhTRIcoIrcorHf+bCw4ZUNB
	+kdQ7kTwUgdMneGXlNKC4a8qKnef3REQfJn1++nyB7bJHbQtj3XDlsrfxy87J+GRUH+gtUx60hh
	Bl10HMmqa545Iunvtr2edIUF8pvu58xE+msUsfdpTmV3eAJXxgoW67uirUdQgKXTt7dON1yQKVg
	1Ro632Jey/YNKE2BoY1aT6UOMGV9Ati3vYUVA=
X-Received: by 2002:a05:622a:5ce:b0:50e:d316:fa39 with SMTP id d75a77b69052e-5162f58fe30mr89912461cf.35.1778750135888;
        Thu, 14 May 2026 02:15:35 -0700 (PDT)
X-Received: by 2002:a05:622a:5ce:b0:50e:d316:fa39 with SMTP id d75a77b69052e-5162f58fe30mr89912291cf.35.1778750135466;
        Thu, 14 May 2026 02:15:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc3fcsm349768e87.48.2026.05.14.02.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:33 -0700 (PDT)
Date: Thu, 14 May 2026 12:15:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update ADSP firmware for x1e80100 platform
Message-ID: <l3nrl2jhcupnkt4awlxrsrvk6ci4cxbhbri4ch2ej5s2c4kvwm@kytv5lv4mjj2>
References: <bbf9ee62-dee8-4de0-a85a-3578cd2e80b3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbf9ee62-dee8-4de0-a85a-3578cd2e80b3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aOgdeLNB5DJjp8lPQv6o_LdG35L2QZoy
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a0592b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=EUspDBNiAAAA:8 a=9LnUdeACKlnS_8maLMQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MSBTYWx0ZWRfX9Z5zVAkjm56V
 OJzigxYmAaUAO2leKHAhE0vYdY2IWITDarONb9Jp3guQKL544VnLXcSOOgB7HEexm/ZDKyL73ur
 XjblZqwv/ME0bsb1vII2tKqudeWnZR9IppLZ0rX2qVTydKdlb5kGZDhD0csePcumIxx3DxYnhyY
 VFw6lzrFZSxmvQvg38waZhn8vS3VEaBEDqV9XJjgIrz17QiWDKQkqunrjmgNWEQRIg3vGaxanLf
 WJvA+76XKMmkFu3Vs7YU/hzBwZaEBbp+4XDmYkxQOHEbghUh6DSn/P4IX4NY5Bj5cwpGxGB9vIt
 UsyW5KiPgdUlw2YePyXPDH6CmSD0wXWuUuPd3QSkdHMwaeDZkXvNXbdXDE4FdH2lckx9P0H0Vv6
 1FxbYiRbFipeGFO9ftejPCqr+7WELpL/HfFEF82y4cTkT4X8wkRLX7SKRLY0X25LJ2ZJF2aUIKR
 SfbX1Yp/8H4MyERr4HQ==
X-Proofpoint-GUID: aOgdeLNB5DJjp8lPQv6o_LdG35L2QZoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140091

On Thu, May 14, 2026 at 12:44:01PM +0530, Saddam Patan wrote:
> The following changes since commit b3ed53e0cb528221d9e21b7842846c3ae3db7512:
> 
>   Merge branch 'lontium' into 'main' (2026-05-13 14:21:24 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-hamoaadsp839
> 
> for you to fetch changes up to 321c5c3195b8f2d39db1687186191ed099c16677:
> 
>   qcom: update ADSP firmware for x1e80100 platform (2026-05-14 12:40:13
> +0530)

Merged and pushed out, thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP firmware for x1e80100 platform
> 
>  WHENCE                     |   2 +-
>  qcom/x1e80100/adsp.mbn     | Bin 17922440 -> 17922440 bytes
>  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

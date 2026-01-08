Return-Path: <SRS0=UU7q=7N=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8C4D185F9
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Jan 2026 13:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3711C2BC86; Thu,  8 Jan 2026 13:57:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10C4CC116C6
	for <linux-firmware@kernel.org>; Thu,  8 Jan 2026 13:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10C4CC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60885M4E2239346
	for <linux-firmware@kernel.org>; Thu, 8 Jan 2026 13:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7hFpxPsqbvmBmGDKcWNrKKG+
	KRo5gZruiTM8cHd/RX8=; b=TcH0vgrWUBpgk+rp7q06tg2OYS4EH7YNNPr2uSJ2
	4JMWsNQMaY8ervdZbg8E8o/AgN5rxggc7EXTuP1wXmqf8jUZ2x99W9vXraOvwT3A
	pnf8xiWjRL3+05cTWy1feU+5/Doa3SX9xjTZDDApy4RnkdTdKtHeR0TbEK/t1mbZ
	T6ywquVkD35M+7gHmdGhvS5VW0yQpIk+Uc5W0mZ8b7J1knTpm87xydi1c2eIoIUt
	qy6Sz7Gk38vl62c6m5bVJwSQcJZdzLdE20JLe+51KYnH23wjH4VbVlTidTldxpW6
	jS3Ybz6V7cbUwUYpLRGu/BvMdDmIMfKx5jW6I7Xy/XwVLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg4792-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 13:57:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51db8ebd9so1023896585a.2
        for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 05:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767880677; x=1768485477; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hFpxPsqbvmBmGDKcWNrKKG+KRo5gZruiTM8cHd/RX8=;
        b=DcP6STBXI3fBtsIViQpyFtrdghy2owXLzw1FlzSUeCCVNUejWcqwix4BMNIYk3UE1d
         MBb6C+PXeYibq0n73TKkIcdXtn/tKWrUf7BakKK//KRKt2WmMBOqH15O4EcwFNjqGCVd
         pOaSE7C1p0veLHUlNBS7n/JLMXHaxr7CdLvUROJMUJ0Cl4c36F4G4fii3xyzGVQZe3aV
         PwvfdFKJ4DhoLT70CWhoptizFnnLimz6MfQDZ76xN2EQQLwivoKGBy1PZDDNKcugNj4q
         XVytKq0kgHXA++9K5+DWQQrclfrZkdfxwZ6LqmlzR0YHhsM/mwneiGbbiTkFir1g3tb9
         AziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880677; x=1768485477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hFpxPsqbvmBmGDKcWNrKKG+KRo5gZruiTM8cHd/RX8=;
        b=NrtVs2qZ9l5u4UAapQSFRIoxIdBgbh+favCgI6WMjDTGJjwT4PubzaVub4SFxZVoVq
         kJq9adENOejVHZLo1ENUrlAN1oA1J1GDrQQ4wvyg7b3T/KHq4OBkTsaWgW1SGOATGBgR
         NaMJcGJkMIFNJtXrIdSAX92YD9OaxnjDKK6ae2vnWmXLj80wG7JpN4NTLvb3Auem2U4i
         XgvlDZH+WtR+e+drgloPYZxwwlG0yLz+YLHtHceM5lIBaOi7Cwso7sQOeXFXCt0Pi4V7
         gVrx7gkWO5SQkQglDcNvC7Km3XLgvMlwGXp9yVQnmdzW5D77T3SgXC/ThUXUbpgagGOu
         n6Yg==
X-Gm-Message-State: AOJu0YzOGlXcj3CMzsE6huwdZKUqZBcCA1Q+pnZDb1vdNcYj0ExwSNPM
	LtG/xgobB+4wWNDZWZqoiHZAecmSDGA7plEb5cjDCPcCtwRJQMK2Dm7OiG6WrYyDy69IxszuPbG
	0QFewHKHqZQOa1+9/6EVZLUOi2W7lihZijzeFPDRD7y3qS07CTyiZo0em6TwpmD3jYnGW0dE=
X-Gm-Gg: AY/fxX4oX2UAmsShMfYGX2c/2qPV1KBOHwqy52ba31tEULJ/y0/eVk0MQb8vXzyLbCi
	PoJWN01SCb9HNH9xXJqbpBVfQKtlY4gjfPoiPOyxHUYKU92A2VVJOQH6kJcUcYBDHk+QDw/tRVW
	SNoqQwwYpk4fvns7hdSbNSbgE+VnY/RPbfupkHUln1IGyF8ixiIV5AeatbaRYdEnkRIinXYyup5
	oymFVD9uVdGV/T8hHBjXIa9GtQ/8sVVRzT7amqU82e/wloSIjZqmFdly5PBAInxDgCkgA3DxpEQ
	ooMkIM4iAVyzByzXyz70eiCL3IJxwbBId2+z+6l7jDV0kLx+frZj0uExdjLtwwlutjCmwiYkD6Y
	zSps4jIBuKMosD6LLRQF9y1b2GF28wPbJgKdBspMwriGkYEk+02hm9JEctYW8azI9Sr5KAHlmX0
	G9CNNXSDSvA8fQDoplAxkavH0=
X-Received: by 2002:a05:620a:3952:b0:8b2:e2ca:36b with SMTP id af79cd13be357-8c389379d2amr812501185a.3.1767880676909;
        Thu, 08 Jan 2026 05:57:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0CmgIttZip3GLWqm0ZEhl7LtNUM8QxUZG93BNULKKSPP/WJ70uEdd9D4YeW3qq7JozKMM2g==
X-Received: by 2002:a05:620a:3952:b0:8b2:e2ca:36b with SMTP id af79cd13be357-8c389379d2amr812497585a.3.1767880676341;
        Thu, 08 Jan 2026 05:57:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fd34bc69sm10095061fa.19.2026.01.08.05.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 05:57:55 -0800 (PST)
Date: Thu, 8 Jan 2026 15:57:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <wdlenakx2molpzcnkka6wxhssppolkknhhartvjku42feiwahd@cu62i5jadqjo>
References: <f4655e94-b451-4dce-8b25-e27b6749d9d8@oss.qualcomm.com>
 <fgnnquqncrkkeza3ch2tafondp6oc3zuf7fv6huljdvdxu5pxv@7ttzf5ixty4j>
 <2229dcdc-73da-4f89-bd4c-40aeff1b39f5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2229dcdc-73da-4f89-bd4c-40aeff1b39f5@oss.qualcomm.com>
X-Proofpoint-GUID: BdlimCsDrMXYWsFiKWuUkqnBllsSHUdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5OSBTYWx0ZWRfX3rBGydnm79sQ
 0jwnYOrFSrvvlNJzylTa6UlNG4GRkdy4bBuHhwI+Q2hgjG25eF7ksKS4RP9KcPXQV7kPaY/WJjG
 jOvxhZLzamZ6jDX7wJoBB4UtSpqAvrCjK3+Xz9DY/m4+E9REBK2inQwawO6sMKM16OaD9VW+H8q
 F28N7yMwxEzO/Y4ecKgO8bh6DarJDAdk/rFUBAcCkWhaltXAUio2Xh0vjeEbshDs6AQdlBXMCAC
 EuWhrJ/s83+98XPfaOWQKHpqopERMUy4P2rgWVwt7Ht4tbdCYOyllekVwSxgooLuIKCuv0TEk8Z
 xFLtRD8bxcyZzLssIUwBDQnT63fZv2xf7hnJiTk1fsdxP1jP7z04zsDVD/sJG/eID84HbcmkTKm
 v4hKPp9BB98ziaqvpT0ezbSihD6KVvBoeIVf0+kn6zpE5e6EUdzqxvlcNXmHLpMvomgLq5dnXG4
 UoVqLEhINDAagGq98yQ==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695fb7e5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=ei4VHJwsoMicz2_ToAIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: BdlimCsDrMXYWsFiKWuUkqnBllsSHUdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080099

On Thu, Jan 08, 2026 at 12:04:36PM +0530, Venkata Kota wrote:
>   Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qcs8300
> 
> for you to fetch changes up to 83f681ab4e6e8b65f42900afd05ebe0b4001458d:
> 
>   qcom: Update DSP firmware for qcs8300 platform (2026-01-08 12:01:12 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for qcs8300 platform
> 
>  WHENCE                  |   6 +++---
>  qcom/qcs8300/adsp.mbn   | Bin 6692864 -> 6791168 bytes
>  qcom/qcs8300/cdsp0.mbn  | Bin 3096576 -> 3170304 bytes
>  qcom/qcs8300/gpdsp0.mbn | Bin 5881856 -> 5984256 bytes
>  4 files changed, 3 insertions(+), 3 deletions(-)
> 
> 

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/848

-- 
With best wishes
Dmitry

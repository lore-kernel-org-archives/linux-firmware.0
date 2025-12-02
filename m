Return-Path: <SRS0=tX4M=6I=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BD5D116F3
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Dec 2025 00:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A88F3C16AAE; Tue,  2 Dec 2025 00:56:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96D10C4CEF1
	for <linux-firmware@kernel.org>; Tue,  2 Dec 2025 00:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96D10C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1J9qGQ1688783
	for <linux-firmware@kernel.org>; Tue, 2 Dec 2025 00:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADTGmoTUZyk5vMrbFe0lrsdUDix3/UaxZhRRwAJsSz4=; b=Mi/gkjifieIsrNef
	UEOiV8X/VNtjyMPiZEsqQxsizJPkWqUbNXlZ7pm9TNN0Ic9ab+7unDS+U8pYGL5D
	hkjjI0EeT/KHWUbHdo8Qt/CEaEHUlLmlVXYfAh2KrAibHp/e4+exegkZdow6eedT
	w0Ie4+REh0N8xKKsplk1DM7cgTWceoNuLBFlMZEX4wFGyMeB4cB0n8EiEUZVCegk
	E7Aua0CzM6cX5IlhEYx02SeCcTxvIETYZ89yvJhERlQYjVmztU8sgpG7UGXNH+o7
	jlKL7xc82kwmiTCuLyMkKDj8AG4C3z5uZciYLvVhml2RAxmIsD2LU7TmTpjwX32Z
	emGQpg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asgxes22b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Dec 2025 00:56:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b286006ffaso865882985a.2
        for <linux-firmware@kernel.org>; Mon, 01 Dec 2025 16:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764636976; x=1765241776; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADTGmoTUZyk5vMrbFe0lrsdUDix3/UaxZhRRwAJsSz4=;
        b=hy/14brwI1W7lOisKrGLD7OwIUQWw3BIcGhJWUeoQ34sUwGEQmqyYcL3gMateSuHu+
         jB3jkuZB1pEqCh2p7xq6sYttiE/U5SQnJGyHt44XF4ncFR6ZazpfTfNBG6T8GrtmKlj2
         Sw881T2yYsKURjw6qMMyx5YZf0KORvWtx6kvhs1AyQw2NaZnjvb4VliTcEaOT+ajUuRH
         DdO97nJMB5XnDUwW3quy/b265xagGZj7u93cmLCJpfTN/8TkePfB5azwC/RH1WO1MNai
         PVZ68SOjzufrq6qCNzodAcxGPQ8+G4vdlCAaCZZh0K4Iiq8HW74hDDzKXq6Qh2qqswkN
         SDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764636976; x=1765241776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADTGmoTUZyk5vMrbFe0lrsdUDix3/UaxZhRRwAJsSz4=;
        b=msq0ARHm0UxcC7mJd5f4ua5qiOW2Y8aAdhDqlv3A5QB2V4o4jId7kPpX5wNwCMWOhU
         SaNm/A7gPGqE5Qp9SyFnxAbDTSvNYb0ekSKTbphxSxuxIEaBt3UGdInJDdBysmwzGMj0
         QcwsGlqIh0ix6GOZO54zWBn1U8nLghnyYUidpyZk1+4qCBvkG7pSW2csa+TyjmrXCkpF
         c36a1V7J3MLXugPH0+dvIH+j8t0L+QmY0ICgNdI4w/ZQgMGjDwR0cRag05MXN6IcVlxx
         A9ruJuryCTppZxexJ6yDzvp2sPPxNH2+b+gkKnBJas7Bw9yQX57DqwEd/cI/7bURJPyp
         L+ow==
X-Gm-Message-State: AOJu0Yxvuw7w8YD3wgWqoxjXquIOT/9qOdtZct/YOGbLJjCJVZ/T2Shp
	33q+DEdMYyNPHHILVwzj0vYU7Uen/sSajc21uW4yOEId4LslGaCuYLXRuz2qUZf/TUsq7lm2s6t
	OmlsbFVpSP1zp/iqggRR/YBJZlV5nXaOJStGcTLMarT5HJoEqtC3Taat7POWlNdE=
X-Gm-Gg: ASbGncvIAREiHZ6uBl/WWRfTlJ9MqAsxWVh/f9ZUAehqklHkiqYO3zWVwIDCQ8njwfS
	dHiEm46y9nulONmIEdIOiWgVsUcdwrqeMVIMm54skvuOU7VYh4EtECqKzJmL3YaymJN/EguAJo2
	AWtptlh0f+SnQERZMdvoHl5j8VJryzTKka3u3duqNeAbk48xsAPj9UBXq5U5EtJMEqeebA9Z38S
	/22xP8QxSkl4utbjhWpQclLJG7GTOTVsBgySbfFrAfISPIq69qtFknRu3u3VkPanklO6PWZ7t22
	+g046m/iqK14l4LBkqmChV4K1A2cLiulXVjnTPrkNoprfnpFjsyEyrnAJkkkc6jG4/0Tr5zzXfo
	p6FOb+SC+g2dLasVCwkxaqK9MBhVrpLHruNSWyqMU+07kXkXcdCh5DVfEnR/D8VbxsnUP7XOLGj
	WddpnZ5A8dvyw/2bTQb5OnF0k=
X-Received: by 2002:a05:620a:17a1:b0:8b2:e38d:2f03 with SMTP id af79cd13be357-8b33d1b13acmr5025398985a.9.1764636975677;
        Mon, 01 Dec 2025 16:56:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYLHhAlBleeFLalUzrXDKRYYJF8NJBttMfIIZOkTer49qmdZiPGNxlSi2OuvVN4S4CUcTXCQ==
X-Received: by 2002:a05:620a:17a1:b0:8b2:e38d:2f03 with SMTP id af79cd13be357-8b33d1b13acmr5025395685a.9.1764636975157;
        Mon, 01 Dec 2025 16:56:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b04basm4040793e87.23.2025.12.01.16.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 16:56:14 -0800 (PST)
Date: Tue, 2 Dec 2025 02:56:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yushan Li <yushan.li@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: update ADSP firmware for x1e80100 and reorder qcs8300
 entries
Message-ID: <zjjag5vbxrkxtxdu2jwtgp2p77notafid7wxvghzoiioyi3amm@7fi3jloyzr4i>
References: <98445810-9894-4ce3-8c55-db3c18e2ae93@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98445810-9894-4ce3-8c55-db3c18e2ae93@oss.qualcomm.com>
X-Proofpoint-GUID: p6UqviWBItSOZpHIaA0A-b9ajeSvnD6o
X-Proofpoint-ORIG-GUID: p6UqviWBItSOZpHIaA0A-b9ajeSvnD6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAwNSBTYWx0ZWRfX8mJR0x3Kd8cg
 ivXB57v1xsVAMX64N4Zbs0wpfypU3QW7jLmVsfKAEtwqohwo40E5Zmiz55wPq8TYWXm3hi8BIuH
 4994eHy/JdDaTDUtc0Ej7olt0ZDFwbXiVZghrDG5KZsqnHy0ulaAHVNgsjzOzgLcD+3Zdz12M3g
 Hw3hzx7AV7ec5aae8WHXJZgwTj+zXFA2GPMRXLply8EiMNeOqRB5PdimtXldIYmhaDFy9yWyE5i
 ZIg98lFQMdfWl0JUCZmwc82etnI4WqbXMvHSGIedcijYXmD2boAxmc9SRuIAbebQ9tYQKkKJqJa
 S82Xn9AL0brhHiX0opwSnNP+t5ELrZYKVOJXs1UHSMdUErG1pEuKeG5jUsxXAgF6vNzDdhUWKTj
 rQ2w0Bt9CJqNvGEtL9N2Pqr+fTB+WQ==
X-Authority-Analysis: v=2.4 cv=A8Zh/qWG c=1 sm=1 tr=0 ts=692e3931 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=6UvKnX1Qr6HWamSQI7wA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020005

On Mon, Dec 01, 2025 at 03:09:24PM +0800, Yushan Li wrote:
> The following changes since commit 14d4b18b066788070c382a5ff7bfdce17ee3313e:
> 
>   Merge branch 'robot/pr-0-1764146897' into 'main' (2025-11-26 09:08:47
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> x1e80100-adsp-1126
> 
> for you to fetch changes up to ca24a0eb728f4f9414edcb1d628f674dfd2acdbf:

Merged and pushed out, thank!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/811

> 
>   qcom: update ADSP firmware for x1e80100 platform, change the license
> (2025-12-01 14:20:07 +0800)
> 
> ----------------------------------------------------------------
> Yushan Li (2):
>       qcom: reorder ADSP, CDSP firmware entries for qcs8300 in WHENCE
>       qcom: update ADSP firmware for x1e80100 platform, change the license
> 
>  WHENCE                     |  33 ++++++++++++++++-----------------
>  qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
>  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>  3 files changed, 16 insertions(+), 17 deletions(-)
> 

-- 
With best wishes
Dmitry

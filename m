Return-Path: <SRS0=LwRb=6D=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1F8CFD2F6
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Nov 2025 12:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7ED59C113D0; Thu, 27 Nov 2025 12:47:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFF97C4CEFB
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 12:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BFF97C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARAVtN0913559
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 12:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f52t16i6N5uClZcga0DrwqZw
	sRR8ITByd7Bofdb96p8=; b=FmLFaSwt1pqHCXclRePFJQUcElWusJS1T0dfFgsQ
	i5aRP2z8H/EWgBzxmt5V/6tts3CFX5pWQALKNdMaSaxWWkOOvCjBDPz59qRfzIVw
	GzMWGy/wNEa3FlDzt3UdlRET1lvgG6HYn/xB6Abe7cwlmmFpHtlIVK3ZukF3YfXj
	9tZbKuP52THZGRMkPImwyfVseXVwXJbwAQ/HJG2UzV7MfoEqcsrOejM8cMCtFOhN
	WwK8E4aDkGP26HqfX1tlQSOa1/rJyBU053Qcx7m2PG0hDrIzqRW70uOd0RPk/zAh
	L5NLvkzf35KIFgB/H89x53LdiYaYaloypeJBvOibjUTJFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynr9w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 12:47:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ff3de05so22402381cf.3
        for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 04:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764247631; x=1764852431; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f52t16i6N5uClZcga0DrwqZwsRR8ITByd7Bofdb96p8=;
        b=Tja4LhEJ7XFMaOeZRdPAO9gLRjSdQ623wb3qwQtZ1yWq4bLFgULuimqr3OKwjx5ft0
         TIzpZU6IEGt3Usa1/entB7CB4WVjb25xlrygbEk2Dte5XpAWTm92ypu3RPAtgZAMqbXs
         XkH0FKs7vHcmPBrhyn1VHs8wvkhB1K8jsO0nFHNApBJdk234Bf7HU4+vLbkZiw2HwA13
         MRHQsqgvCbV+yfnmczEBc9pHArnHUMr5tW22aM9gw2Lc/nUVz+qUFozg8ETtJ6vygMLi
         4e4vh5gXzFTGEgVT8Z5jQMOPbgZUn3H4aRWYeW4qE9f472pocx3jkv0aiIYX9gTZe8pR
         9wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247631; x=1764852431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f52t16i6N5uClZcga0DrwqZwsRR8ITByd7Bofdb96p8=;
        b=i/relOHuwtyquNovxvH1ANZxiCjcmOAV9llnI4hbvgNvkt3mfli5gR8Q9keywtU7Yg
         tlUFmn4eHRjssK1yZJWZpL3gLorWtMJb2mnVZFy00tv8FGlup8wVRyI9QrRZUNkmFaCH
         1AO//XWSe+T8j418qEBoReatX7PBhml287ApZBifiQ0wzVmPGFkxe3I0w0vcPvqkUUzR
         bAEY3UnIJWno9+fihb8BrE+GxrYxHJjcaRWy1RsTteHpk/0QA1QX2iSDbSSnWAr0dCw2
         TaTZLGcWF0cKWed5d2PdajeeK0r2W8R/IrJWB7jM85aEqhJvFUFp0LIXJR9VavEBGFKh
         NguA==
X-Gm-Message-State: AOJu0YwYvRXBKKKnaB004eBbGBNZ3q9H57GNoJJp05c3WpGAD0PdSr9l
	1ibclEI3+vO3uzeE1alAnfMxRAr1br5bQv2aDQ8GxfqzJYCU6f4RzB2oLJKrAH/6j3CVyl8XPKe
	EnMWFn1fYLN9T/X4msZLnPjCjvFlyfUR94Hc7IeNwqN+gscOGDzNDCtV3KfgcWF6u1vUIlcc=
X-Gm-Gg: ASbGncuzSyxVoQAYgSfPJkeO9e8pY3QE6/yvAv6AHYTwUFNYRF00E+KIq8KrpLcQUBn
	CqNmLqQRRJMAGesZ/yxftnUGYa1CGWEwRtHDnsrm60g08y9mwvqo9E1tyxAdRo3Tl2fP8UzBt4J
	kw8By1TfqVaUcrIfxgD2J55xcAaEMpM0Z47En2xjx+MeiEnlPG9tynxorqa+e8lYno83ZUfHJyi
	T7VyoLrUUbum4DSDnnjPdbYg0XJ93zGivL8Iy+k8nGhRXof9pu0vw9EExP7rEsMPFnmd7n/sx9V
	gTE+8AFVZR4P5kVRVPWilhyUH1HBGNvNtJBDxFIlQhYnG2MZ/hKHMDb6OzE4D7KzGJfC/P+iENY
	41C9cIibJtXBZIuw5+oh/7wY/n22eal8Yxi1Slsp4TzkyRPsCIkd1cjFETnFAnRJiljX24XYJv9
	tUlwy4TMDsXWxNC7t7D7C2Oeo=
X-Received: by 2002:a05:622a:1b8f:b0:4eb:a8ba:947b with SMTP id d75a77b69052e-4efbda39926mr130914851cf.24.1764247630497;
        Thu, 27 Nov 2025 04:47:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGhfVA7LQjeglTR4r/DIy5ahXPhubrdo1asmd9G/FIehGJrWBqga2mgqGSjLA/hCqKcyfC+A==
X-Received: by 2002:a05:622a:1b8f:b0:4eb:a8ba:947b with SMTP id d75a77b69052e-4efbda39926mr130914481cf.24.1764247629971;
        Thu, 27 Nov 2025 04:47:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f12sm385796e87.53.2025.11.27.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 04:47:09 -0800 (PST)
Date: Thu, 27 Nov 2025 14:47:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: fix version string for video firmware for SM8550
Message-ID: <d2dvht7vr4ph7t7fwnx26wdufrk4bpofdp5lafp3ad6c3xgqsb@6n5na4zq75ak>
References: <4246c749-75e2-917b-0e75-6fcbc2cfff2c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4246c749-75e2-917b-0e75-6fcbc2cfff2c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9nTFUVqfT4y6dwFzK49TMYX5JTk-bfOZ
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=69284850 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=4AsHKIneIj1FEZ4agSoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA5NCBTYWx0ZWRfXyQmdsRL1utXs
 lrIJEB7FIHOB6m6kFFyj+rwrPE+n6Agu/3PWoriC681Jn0eL+OXuwPRVp15OTWAGT8iTOnxv/Dw
 2HBhNzRkpOIVt8iNEYT90E/pj9cr+JuuVqCXNoWd78+ClSF1ODaq3B3hzqj5HkZpcc3OrN2yXZy
 3XccHLTvqvuyTIZyN3l8NdlspTipuSNJaiKVF2L7UGuDtH9mjY0w+yylSx83JaGy0m0GfolLCGD
 I4KVLiO9H1XP0ZgPb4BxI4TciYPG2xDptmxLIN1TtRZ9bLA+Jxll4nVoV7AVXUp29gKITPGXBtw
 vl/Rnuo8I80jLQD0ivoRSGBUuIpsDC6SppjZ6s024taczaN1NlWI+jA9wl47BudQc8vlYtK5uFS
 otTRziTkcHz0JwlSr2/e32C85a9OEQ==
X-Proofpoint-GUID: 9nTFUVqfT4y6dwFzK49TMYX5JTk-bfOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270094

On Thu, Nov 27, 2025 at 12:10:28PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit 14d4b18b066788070c382a5ff7bfdce17ee3313e:
> 
>   Merge branch 'robot/pr-0-1764146897' into 'main' (2025-11-26 09:08:47 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-version-fix-SM8550
> 
> for you to fetch changes up to c91948d8a672df6e91b2b5040eeb9b98202fad92:
> 
>   WHENCE: fix version string for video firmware (2025-11-27 12:08:48 +0530)

Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/806

> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       WHENCE: fix version string for video firmware
> 
>  WHENCE | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry

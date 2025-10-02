Return-Path: <SRS0=yklG=4L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DA8CCA470
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 00:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56FC9C4CEFA; Thu,  2 Oct 2025 00:48:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DB68C4CEF5
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 00:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DB68C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic5li005972
	for <linux-firmware@kernel.org>; Thu, 2 Oct 2025 00:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PQP/6F2fIsUw8+i01vPVorxi
	56WNUa7YljfQgMAMFzc=; b=p2kK5+GrcVDhAcRe6iQm28aYnUIlBYcpTaTvrM3F
	Lo07tTOE7gqlYwM8MeLuCDzSGKQYisy3CdXxXt8qN2MKIOGxwMuODLhaBzpTPYtn
	ksphaCoB1cdLkNYQBnNdz6op3VhxeyWfxzF5CRhr+4KdCQH+6pluZfuMCkPLvr1J
	XbyY6rTA+s3DcGAnMV72qvH9JKXHKxdFT403g21CwG+FyoP7Zd+HrYLtf/qsYoz6
	G1eOGC+BynhQ6b3aXPTmiQ8qZrbP/0me9k7UcLPDSqjKfQIsqJLcN8x/8v0bKEd8
	C5+AYPAJ47I9QjTp+gSW3I1Rt3bElhf+dVh1KwRtzR14bQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdp1p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 00:48:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4bf1e8c996eso15996421cf.1
        for <linux-firmware@kernel.org>; Wed, 01 Oct 2025 17:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759366136; x=1759970936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQP/6F2fIsUw8+i01vPVorxi56WNUa7YljfQgMAMFzc=;
        b=MWdYxJ0FvFkTprCDZ/jUEO9dm1n7FLW/yEga8TB929RjXjJEl2XcEONFQSsWlrKxMB
         /G9GYfCl3NRX2mgJH5KwpR4LiNcoREsjIySOo0VHnJaYrkUUSm6apJpqqyD/mawKWJS0
         7qYKPPVxj3ysdAjpNRYxtgR/mu8r1NS3LXNOXN6TVs/JbeJaeH76CGYvW9Lg0YdYXiNE
         FHT9Wx6/5QNc5lg8DXI8HfaHMx7SEiQh15EZ0SjVdHEvcf6gzkOhJdSu0tYqnERtHgYi
         o6SKemOS6cOudo25ZJ0XaDGY9XAjlmk744V+qqrpXq8GpV5jSfTrsRGoO5y/QyjOsP87
         iuWQ==
X-Gm-Message-State: AOJu0Yym0+UK5H2GrURXN9t79FT02nt7o6QABQoCO3Devvwx28tt6YJP
	JhYerLVz88yasW5tDtiwSaWBY/GTvskT+mR/CoZLl0yrVYriRQYNUw+kfsDxHPxngPtYagvH6Rd
	KCJorAGh9kobXNSjTHJxKprpVghX4xybB0RwBV3bNGC8d+5y3X8qF0/6P43Z7ZRU=
X-Gm-Gg: ASbGncuP2GsbJAdJ0pwQywgStrKvlKBcQVbn783szTIwH1MIWahRomYuW3w7+tLTZe9
	k3KRJ4R8wz8XGJX0s30rGvWRv7ZZb0fX2C1rvgy0MqgWUWi1YuKo1CxV5UYwjbCg8YU5SXJMOQH
	GlGW+MgHtXQhEgf9u9vTVoZfb8y+2F9gvO29miEQNSEiKVtUZvuAor7spHXl0BxdJWx93ozMS7z
	ESL+wsFfdr8F1+JMLkQCskLAIkGs87jFZLF2sU3GTlpBPf6z/KgtsfnavKTRYnhVR4d3ViCgXpN
	xTM2rCe9kwSlBjEhcKZl4ys8Bpqp5Y9lsI58kBg50macNiA+9BTFaxix5/Zo8CyyJw03zggaj+G
	imKu7JhSHj4n1hr1rTNERAaIdW96gPguFckqbauSLvuogElC6lxHGljtphw==
X-Received: by 2002:a05:622a:1a27:b0:4d9:5f2c:10c1 with SMTP id d75a77b69052e-4e41e72f743mr73393481cf.42.1759366136046;
        Wed, 01 Oct 2025 17:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAeyoc3SDL8XhcyNJIQKLtmPfzWojGNJWqc0Dvw/JqnUBm62evDLCzcf8rXMTNyGD1EI5txw==
X-Received: by 2002:a05:622a:1a27:b0:4d9:5f2c:10c1 with SMTP id d75a77b69052e-4e41e72f743mr73393241cf.42.1759366135566;
        Wed, 01 Oct 2025 17:48:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0112462esm336144e87.3.2025.10.01.17.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 17:48:54 -0700 (PDT)
Date: Thu, 2 Oct 2025 03:48:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: add video firmware for Kaanapali
Message-ID: <e2wyi33p42lsq5f6ihuw54k5q6czbt2en5ocijswypjgw52dbg@wz6x2fojxvoa>
References: <bbd5acf0-e985-1f55-052d-8d3ecf0aa910@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbd5acf0-e985-1f55-052d-8d3ecf0aa910@oss.qualcomm.com>
X-Proofpoint-GUID: -KcZ_ct-uWshh0doS2npyf9-rr3cH0V2
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68ddcbf9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=I22L1DIJtXMk8jElv2kA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: -KcZ_ct-uWshh0doS2npyf9-rr3cH0V2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX9g64+L5r5AyQ
 Br8dShWX/ynqwiX1iWBk1frgKuI/u6+CzVerBfwCmgrLObMXee7FcLfuBDH2ovYPGQnYIRFzhNO
 chw/X7rB+pJuCRgQKUscBOxJk7pBj6I+WJ5WgRzyJ5kG8Q275XpWTeO+g8aXTlsq5tvxTzZFsxs
 WBYMauJVzFgvYYK5775YOPq2iUasI1Yw51CRdbJYBU8DVjRkEke3y8G6J3M7ULXdYHYmEyjNvOD
 SL12bpSNOn3X1wdWyzTSGx0jjmqbJEdHBthQPAXgdAVdW1I5IKIqHM3+A4A4FBu9Q9TSeGjbKHu
 iinj1b7Hsva8B9tuvQ/SK90oa4cs4qAWnxbImhsxQkCdToqwx28Qk2mg8NVjYTMad7jBG/K17RP
 edXrFfEXXu8MUH5O5aMQVtOlexF9EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On Wed, Oct 01, 2025 at 06:36:11PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e83e5a:
> 
>   Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-kaanapali
> 
> for you to fetch changes up to 7c2d4d41e96fdddfa360c0740e8a8ee9b5efb572:
> 
>   qcom: vpu: add video firmware for Kaanapali (2025-10-01 18:32:02 +0530)

+Link: qcom/vpu/vpu40_p2.mbn -> vpu40_p2_s7.mbn

Can we please drop that link? FWIW the driver for that platform is not
yet merged.

> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: add video firmware for Kaanapali
> 
>  WHENCE                   |   5 +++++
>  qcom/vpu/vpu40_p2_s7.mbn | Bin 0 -> 2474696 bytes
>  2 files changed, 5 insertions(+)
>  create mode 100644 qcom/vpu/vpu40_p2_s7.mbn
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry

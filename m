Return-Path: <SRS0=tHq3=4B=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73002CAC5AC
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Sep 2025 10:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F23FC19422; Mon, 22 Sep 2025 10:19:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47BCCC116B1
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 10:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47BCCC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7pTPW006138
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 10:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+cbOkexdAloL8Q5u6S9Yi9GH
	CnzCL3hOTIRQn00FbK4=; b=V8sua7+moCGRHlW9wHBYJLiZagrKrpIL6VD3l940
	ctcIrpIN+OlYKBDfIHI6i30ry1wbrNwN/JDwvaEqNBZEEaj1xUN+1h/jWZ8W5zWw
	lexIH3JeV2muBRhgWPcgbLyK++0fte1q9xZRvzI8+ACrU6Igo4UndosbNoZsCN4v
	RysWJAr9nwJb/SJm5r7dHpC7Axqyq1n5y74fsBbJGnCgElI2ftg7faRNfOZAjHmx
	JzNmWeqMJPdWGIBEEWXO+Lk7+KDG/6dulyEbXWNgz1WpmUxqvSJHbjCGAZKucqaQ
	yzivQN+JxDv3nrHr1ppDSXYqvOnoT7/PiD3l4919hTG60w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b2e10h79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 10:19:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-79538b281cdso65444466d6.0
        for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 03:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758536386; x=1759141186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cbOkexdAloL8Q5u6S9Yi9GHCnzCL3hOTIRQn00FbK4=;
        b=m+/VrzZAwF/CSs8RwMdfKmOCx28FpU+NhrOW3V1jWoPK6zVZqtLDT3RkcnGTqmMJRU
         mp9wbxECI6dnyLXB5SoRJd4zGelcEPsxTSaC/wm3InG+dqvi5iSDYmVMS8V/hiRhS6Zg
         7y3Zz3NE6vu6r6ivXAukBlkbUxf03corjW5YFuk2Hl5lwEJAQXGLNC85xy7Fe1KXh6/X
         xTMqjZIR1iWvEBxObvYaqfWZRv1AGBaCBUGoNw0gm170cCDR2xbsXsILXwFLTz0MjIKK
         v1uFCuN1gIfHCjS0iABVy68DEqWRL5ySBhvwkaJtNTZDZOXvCYOs3M0XA+wA55ZGBz2g
         /qpA==
X-Gm-Message-State: AOJu0Yw98S7um/esa2+W9/R95F7rGmxG43/XFoHyXFiXAeX8Y/80AZ+i
	RiP7/nnf+aBlrasaR813lXJvG+iRrbu6ClNGzk0Tcu5YLSASV/loKAwAQB+TomPJi1WCUPO2xz8
	3Oh1mvulcZvKvrurcg40kqmZ4kku3HJHFiUHhT8V/D7s1YAGtfhlwdcqkBYK4ncM=
X-Gm-Gg: ASbGnctjwChhO4JBlIg+Yvm+MxgiReqGFjJAP9YMiZ3+Iv8FSKe7JQy9k0M5YJEwzJf
	wCQ2Kh10C4ocCISJHFX8aiSKbVVGrnP1Q97KCfsscq2PZYHXS/KEAmNgHHo6vi152cZpzonQ0H+
	R1ieYXcZrZkByHJODRlMGUn3hsdwWy2/upiV5r4EBkCSHOUVdhxevhbly3QDja7M7zYvyd4Z4D8
	jT904KRN3t7/YafHZ5d16941wpDsTnZWNPGhhhtsgl+ZpWepVO1UO8dCySwd4WEueI+X6KEOBWF
	uAVZzzBaL/YcSzqc+U6LXR3iTF8Vnr209NQHv6gE1QrpwrXA6tQ6pkGAP9ZYHXDJstsyW85GB+l
	PcPxPl4k6KprIjIPJ3pQZFkQZI150tRkAxpdHuXQN/OowMV196bo0
X-Received: by 2002:a05:6214:7f0:b0:792:fd55:c30c with SMTP id 6a1803df08f44-792fd55c3b5mr100477676d6.17.1758536385816;
        Mon, 22 Sep 2025 03:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDNgLz7LKilV5AbaB56beJtzY3PtY9z+CTsEhyqzaVeEu2QPAYORwHQP2yWI3ysVUhX6tYJw==
X-Received: by 2002:a05:6214:7f0:b0:792:fd55:c30c with SMTP id 6a1803df08f44-792fd55c3b5mr100477476d6.17.1758536385232;
        Mon, 22 Sep 2025 03:19:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-368ded93b28sm12306871fa.48.2025.09.22.03.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:19:44 -0700 (PDT)
Date: Mon, 22 Sep 2025 13:19:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com, kssb@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <mtdzhkdv7ex76o5gdfw3llz7r2g6yfonzsmvny6gy5wpf2onuo@m7kibf5nhoji>
References: <575b65b7-a9c8-481a-bdaf-bbab39389b62@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <575b65b7-a9c8-481a-bdaf-bbab39389b62@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA3NiBTYWx0ZWRfXzkp4VgtdzVk5
 YKsJ9jop+IhRXtk6i1EvFRxjsnpuUOZ/gF8eLj/z/6qN48gEHDpMjufmvFd3fho1Cv/DL081PNP
 jAzHp6Dm09QDAua7F7zF6AxOQh7nGq9oVdXl2g4aGnOrNI2nWo1FLg/AX14PISwNS9R2g97AFdQ
 SY4xYTMneAqL+3kc6OMTy1tFAtTMlaxWO1KORL6PlmEwPPQAUmgQofro0ecHCNGlBzoYqWuch55
 7TqJbPk9ihwFCfRMDoP1N0WN+T01VCCFXLYpKGEq7G9uMa5kNP77lan/k97J8nZAgvdfRSe+v9V
 4pPxXoQMJfezLPGaU8FHGzuytUnooL9ZvESDK/BX6jSuTzgeBIcPxQfs3uLv5zsBeiVNKPqP/29
 9MD6Jov2
X-Proofpoint-ORIG-GUID: ESz1aP7splUuTAFE0gRo9Auqj_SCK3vl
X-Authority-Analysis: v=2.4 cv=HM7DFptv c=1 sm=1 tr=0 ts=68d122c3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=-hUEHlRs5wWMZovHI_sA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: ESz1aP7splUuTAFE0gRo9Auqj_SCK3vl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220076

On Mon, Sep 22, 2025 at 03:39:54PM +0530, Venkata Kota wrote:
> The following changes since commit 493de17dee9901605e69ad804815cd7408d84547:
> 
>   Merge branch 'robot/pr-0-1758303798' into 'main' (2025-09-19 18:33:44
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-qcs8300-dspmon-125
> 
> for you to fetch changes up to 704b227a99683715bc8f3fb514bc6b9d18372f28:
> 
>   qcom: Update DSP firmware for qcs8300 platform. (2025-09-22 15:30:25
> +0530)

This commit isn't present inside the branch.

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for qcs8300 platform.
> 
>  WHENCE                  |   6 +++---
>  qcom/qcs8300/adsp.mbn   | Bin 6643712 -> 6684672 bytes
>  qcom/qcs8300/cdsp0.mbn  | Bin 3084288 -> 3080192 bytes
>  qcom/qcs8300/gpdsp0.mbn | Bin 5832704 -> 5873664 bytes
>  4 files changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

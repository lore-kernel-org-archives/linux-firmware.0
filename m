Return-Path: <SRS0=LwRb=6D=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F68D11183
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Nov 2025 12:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCE35C113D0; Thu, 27 Nov 2025 12:48:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1908DC4CEF8
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 12:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1908DC4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARAWCiw914172
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 12:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmJNN4QRDtQR/4v+YaCkwzDrbcVnw+nP6iTLM9YXvak=; b=mdSiM86rPe+jyevh
	cZirxCqf1+oOMMHqE4vJ3mCII2DPfc+iFWszf3jZ9WyQ+Vc1l2mgJuXXzf4B5X9Q
	0crDanJjHV9srKxj334uhKXnB6nJU/ejdiD6l/IBQ6192cCMz6415uxFL+SV68nl
	wtyVtVLZRa/qJMJQLSTgprajJgFiltb6/5FTfG6vGm1ITxroWRu+Wv8nVseKSraa
	JEMH+ljegra2ESvA9jCkQym5wGenq8jTn8WRloDNvdEriFuoqNafCFA2NK5mSwji
	ueFlilfiGf56IGlMhI/BGX5alocIso9XsgdbSmdqCNwSgE6I8U1RHKPuTkYJ1GHk
	yT6xXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynra0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 12:48:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823a371984so11594606d6.1
        for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 04:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764247727; x=1764852527; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmJNN4QRDtQR/4v+YaCkwzDrbcVnw+nP6iTLM9YXvak=;
        b=BUZ6xtymU8td2ECJCWHSrm2gvJcaWZVEqjrmG7R3PDjUNx0xNfuYdbDxdZI8otDGCv
         HqXTswHXmiXByvkQXt9QylFYvknW8zxP0Y2Kt9dKTO6BpQQazzSFkx+IgFxWEY7j5hld
         V1fs3B3KGjb/dzLuuZmL5Q5CpAwAT++uPTMFGklZ4Ncp0aGMBhpyRsPH7smeYLtzFRau
         64vX56S2+2iFqpUvzJcdpJugJVyUw6ZoXaOnVtXVMafMx6rxnahWag8PZpa1O8/ka0Ox
         H5d4zEglRUm1e/OYtGwKS2B0ljKrgTlvGC52uz1yTRtFbMWlr8cAVdCGbyFCUPA0MMWf
         Y4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247727; x=1764852527;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmJNN4QRDtQR/4v+YaCkwzDrbcVnw+nP6iTLM9YXvak=;
        b=OClKyx08JL/oBuKJjGm1i+fF28b+r17hABGMhFAwT6ibZW9pNNHIU/pwhA/tO39Xjl
         9X8ud3c4eP0kmSrIVr2MpiRxhXIiP9HQLWt/ZGDDzfQlQaNbptmoefDeYcBiNOmmzXAZ
         duRL0n8b4e+jVc13pEIWZD6WjKxhfPqdW8cZ0K2Yty+V3/aXi0GXzOuoAZSr/50FxuCt
         1Yz8siysCcgNNrKdUhdsXer305HrfM3q0xZODMFf1EV3vElc2y8+3lvsBPDeFtj8qnht
         4Hs5GW7SSlsJMM1IblLnnyN0xkNPTA6/1GVdXzvg1PM3FV1wASps0F9dCJLftHJIrfYr
         Cd2w==
X-Gm-Message-State: AOJu0YwS93yEnXyq31gyArNzL42HalrqoUvjgzTxIu3jfYjri8/BXoiZ
	VQ9p5ZI3VXJ7oBQ/toLjSx22zhxyBPGr9wy/iLQYDuH2i+DIjV1beKAQzdpjfso5j1O6cRbc/VK
	xf56mYSve9DIG4SjsTtctvCH5JjhsxvDHjjxxjeoO2UwrcU4JXeMa255Wovc2zOI=
X-Gm-Gg: ASbGncsmfl4CKcbXhBKh+KYfujRnD7ZFmmChQZe6EuRVsirLc98zoKH7i3xDWvEx32i
	0H5Cj/RTMNO6ztPTV1UB+KV/Oeb987uRbt+7epVNBAhM9pVzD/+FCqCld6/VLwLZ9hP+CxlT9a/
	t29RDxkDDXzOJmhfk0QpYUPYxkFTwUOCf/Ik3qCCKVOVULeV7eoy4aCa0vSisszS1T/9rkcGVbJ
	S6+C5Y44qCdsE/zcAiMcOIQrJs5kj9c93hpdPhQeyS1u39h/fdxJ5qsII8ud7XfmELXaTXJi/HX
	19NKlhSg6o1Wwxn+U4jhon6BjDhrKMq1gSHcvL7hojSoAhG89J7sq6fEUjKKTD0iMf62ccLD8xx
	n0LELMvqOM4NJZ8RjrFjT2G6TIt7qXXpz0mdPl+Obs/zIoXixRKSxO5rS+VSZ3MUNKUzaJP1BMv
	MvtcmRByzP2DXsRi2KkPmbdTo=
X-Received: by 2002:ad4:5bc3:0:b0:882:7857:a2c1 with SMTP id 6a1803df08f44-8847c4e410fmr345144716d6.17.1764247727140;
        Thu, 27 Nov 2025 04:48:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN7Nyd5ycm6n0JQ2p8JhH+rx6V1hXSgHNvii89Iwx0fH4IDfWyLf5qmsL8xEsteve1OKJNGA==
X-Received: by 2002:ad4:5bc3:0:b0:882:7857:a2c1 with SMTP id 6a1803df08f44-8847c4e410fmr345144366d6.17.1764247726644;
        Thu, 27 Nov 2025 04:48:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7befsm385145e87.9.2025.11.27.04.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 04:48:45 -0800 (PST)
Date: Thu, 27 Nov 2025 14:48:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yushan Li <yushan.li@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add ADSP firmware for x1e80100 platform
Message-ID: <nlwzgaiyiehrtyeepghkpigkfemy426burylmu47akkiohkv3e@k6nk7uxrbobd>
References: <f1482155-eeff-4885-a3a9-088d53377fbe@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1482155-eeff-4885-a3a9-088d53377fbe@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AN6J7_ExPUlG0MkYGY2RBZu4IpdMeVni
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=692848b0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=fNNAtXXHqmuIcZMg6JEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA5NCBTYWx0ZWRfXw1Uqi/0/IiYv
 1E1H24gbizo/MTx0JFpI+wQDNfi/NV5hP9wA7n/3J3klt7cakDBuUerQnHmf8gKodN9rWT78JR7
 b1GgGPecW4N/6LPhwLvBVKOvGFhNCHLXZZjEasp/ZJjDC2L8j2JoNSkJfjDdRnauHA4k4Q5CJby
 DX/PXA2GDfQTBqNf8gHkpgJgzJLLwudxi2lPUXVpMK9hqJA1vMIPGxei9TBrqBkQQz/9rl6w51C
 KpKuhRrE7ys4KfRIY2Scggf37TbpYjAShHjxa4/FE5KxwcbUY9/4ptbUJ+VsOhF1Jx6YtC5N2+9
 6vVFjVIuO7sILAwIij/I1es9GLsyrB1P7QtaPqt/GpIiLtOcQnQIkFSNe0s81Voxj8eGQ21F9Q4
 8eE2UDluN3mLM0Elw21JfkSN/szqLQ==
X-Proofpoint-GUID: AN6J7_ExPUlG0MkYGY2RBZu4IpdMeVni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270094

On Thu, Nov 27, 2025 at 03:35:09PM +0800, Yushan Li wrote:
> The following changes since commit 23568a4b942079631c9378011aa0a9b29de19370:
> 
>   Merge branch 'intel/guc-v70540' into 'main' (2025-11-25 18:40:29 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> x1e80100-adsp-1126
> 
> for you to fetch changes up to 63cbc5f5f40326f5c361f4e0575ffb1564d7f471:
> 
>   qcom: add ADSP firmware for x1e80100 platform (2025-11-27 14:08:00 +0800)

You can't say that you 'add' them if you are replacing existing files.

Also you are siliently changing the licence for those files, this is a
no-go. Please briefly mention this in the commit subject and explain in
the commit message.

> 
> ----------------------------------------------------------------
> Yushan Li (1):
>       qcom: add ADSP firmware for x1e80100 platform
> 
>  WHENCE                     |  14 +++++++-------
>  qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
>  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

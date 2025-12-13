Return-Path: <SRS0=lVva=6T=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD37BD59F5F
	for <linux-firmware@archiver.kernel.org>; Sat, 13 Dec 2025 03:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADD75C113D0; Sat, 13 Dec 2025 03:22:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C73B4C4CEF7
	for <linux-firmware@kernel.org>; Sat, 13 Dec 2025 03:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C73B4C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD28gRo1895433
	for <linux-firmware@kernel.org>; Sat, 13 Dec 2025 03:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RnF7asRb/5Nlin2p1sZe8L49
	aGYKTpiacjJ9LQshqDQ=; b=IERUojp+sHk0ogJVkgvBHkqZGp8WiSH0Ap6IvpsS
	ZtvI7LbBoCsSsr6ncdoTyv19wPLV8c4hyaSvqdmUNqBIm8Jt2Ok+O1AHpbm1VK0U
	MRFJUEwU8NaX6ESh37GEKEyI4wOFAG7n1JrMuvX01LExy/NF3fsXaB5m9xXpOxhV
	6mfz+xeKYjKHd9Z49sC4d7DYDDKDNGlK9m0hEXnUGrgN+43SzFf6yfTPux4watvI
	MBDKzCA1cFbISqNb7TizXmrxJI6xwVZQNNhFr2NE92E6lUBbmv/Kgqm1IwsIWugT
	XRHDLPZazRGHe3exqBd/7RzheqBSvPtOtRW1IKA4uyxcHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0y3rr2fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 13 Dec 2025 03:22:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee1b7293e7so52307381cf.0
        for <linux-firmware@kernel.org>; Fri, 12 Dec 2025 19:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765596131; x=1766200931; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RnF7asRb/5Nlin2p1sZe8L49aGYKTpiacjJ9LQshqDQ=;
        b=DIQcTpBmSfl78MQP+WqsmeXxJyXqnHou452nrpNT8P3e36o7oyEOf3kyrvn9TMm6Pn
         lepT4i5vSbd3YiAIYtXKxCVFq72DHcErzaifIP/Z3yRbUp6W6V4HVN4y0mVj6nDSi6Vy
         aGi67G8YHBzIS5OOBxipTUR+JSW2Tbmn3S06imXZZl6xkCaVHzTAs6DZFAClTV4jC7DP
         3ehXLpFU0K1yHqSY5dBRJAqzgcdFOibIKIHShtCC6ip0ePeqAvxhJhQWRhQ9aCy3uxXV
         xkmvXf+S10aukpHoKMiX/LfVicEUdOhOMUKz9QjQaYJozOW3Pcjw6QVel6M/+e0V9o6P
         TRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765596131; x=1766200931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnF7asRb/5Nlin2p1sZe8L49aGYKTpiacjJ9LQshqDQ=;
        b=dLbkv3yEINJjMUaV0FqASg0pcM+TX5o14g34H95oA9kOvL+ME58F1+ov/2e9nG8Lcx
         JA/wDLN9A45hG4V2n5oiqElJSD7lRKN4SpkLSlEekumG2Zv/xzviAjdqB9HFF+/xuGrh
         HNMMkPdSCcnk8PMzaRJFtSOfo6CqKN2iMM2toJnbb/bQlWqKvhCtE7q4v5AvbIR1ZPdG
         YXqfUM2dANldWhl+S2kQfgd2TeZGl7p2SuCUWNXZlho0SsubBdIEhhbU7h9F08F30PtW
         GBbGnZC1xOBKEB1oWdNaePL8HgqstBROy5v8P/PxBB0c5/Jgcnqlq0peLKwSiyJitZiI
         bfdw==
X-Forwarded-Encrypted: i=1; AJvYcCVB7b7g+90+CyjTfGjeyvSD3FN7p3orlM7HyVhzJjycj525eU4hK9nWT+c99C0IJj8Adz6aiYfcaEoNcH59rQ==@kernel.org
X-Gm-Message-State: AOJu0YzVUU+jd9Yr+ZsijaTg1IwTjSim3I9/7Rnux5uRS18Nxfy1aJLq
	DTLDgP28vNQBKjIeqd5NCqX5KvTKe5ZJPfuCzSfIoMVWIBq25nP4d0pUaRWcYaZEMMFDUiF8I+t
	CoOYL0vrjVcl4WnPdJ4vQL+JS3K5frFIPB5it34ALSe30WsHFIuMycM9CRqugDy8=
X-Gm-Gg: AY/fxX7j9Xn25o1LSU2YebJ4xVfnFLksRBA4gBgpT2MrHn85HWBHqBZFl8owu+g/jYa
	iualiGSs4gnDIjB7kUnUNe3uXccxTbXcqhxZM1gMsPzFwvGVc/p3gyL7Hn7VKCiglZR7y14jLSb
	5nNdjeYzsAJwdy7o+Nz20R5rGnVoNv8yHMkUzr3dcJSVYOvJRCg4ZkKhmTvP+0I/8Q+fxg4DWxN
	d5Mt97Zh5HUO2nr/67+mHNwAl2CdbpEIIFrIi1BONvCSUhEh9YKrIHpFibcLMzBnXfpAJJl60sp
	8iVCSWuEBN0W0VKuNhU1x6Bxdn0DV6V7Idkd6duepQo/CC45+9WYCk1nturZm8UcmqivvC0RY6C
	M31U9r73Q6UNjU2AwPaNZAtcR9uocFhhPX6wHUCOdjW0W7GBZLzGUHhIH867Kq7fmyj9/Uyh7s7
	nR+3YLQ5TUdDKP4lMI1KODy34=
X-Received: by 2002:ac8:5d4b:0:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f1d04f4944mr55108041cf.36.1765596131177;
        Fri, 12 Dec 2025 19:22:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH66jb+RPh3sKibqKnGGLds3MW8G8OZK1a/VrlCgE8uwtn+xIXa4XctFuS3a4VUUxfLCGdsZQ==
X-Received: by 2002:ac8:5d4b:0:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f1d04f4944mr55107851cf.36.1765596130755;
        Fri, 12 Dec 2025 19:22:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f31997f0sm2571914e87.93.2025.12.12.19.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 19:22:08 -0800 (PST)
Date: Sat, 13 Dec 2025 05:22:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shreyash Chaurasia <shreyashcebola@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: asusindia_cs@asus.com, linux-firmware@kernel.org, support@imcnetworks.com
Subject: Re: Request for Updated Bluetooth Firmware for ASUS =?utf-8?Q?Lap?=
 =?utf-8?Q?top_=28Realtek=2FIMC_Networks_=E2=80=93?= USB ID 13d3:3612)
Message-ID: <44jpmejvf2aph2xl74p44m6xy4tjacsanu6hyabjuomjq4j465@5mvjwm4zt4x6>
References: <CAP+hjTVEJfm2O7ZHdShKCzXKGJhZaeZVWQMb24a51JR=r973Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP+hjTVEJfm2O7ZHdShKCzXKGJhZaeZVWQMb24a51JR=r973Jg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=X/1f6WTe c=1 sm=1 tr=0 ts=693cdbe4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ib5_XgNjFPrxDfuENlYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: J_AJbtCqAprdYf953OzYLLsmYWnuxRD5
X-Proofpoint-GUID: J_AJbtCqAprdYf953OzYLLsmYWnuxRD5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyNiBTYWx0ZWRfX4O30hI2powBo
 /SXP1CMNP993pZy3HInVlVlnHNkk5baRMLZPqrM0yLYj8SA/YDvUkroT7/hs/V7hNWeM9Ke+Ur/
 JM4uEW9fiqaS5flvJa2VqXpt6nXt8fxUt0RyLAiI+rV4FZrYMiSD32HItkrL5q6ZQuz7pyr7eT7
 ydZcaGD6IvNL+assxHs+rQfdUxkhqfDBMOUVelVi30P2J6dlAnGrrjXCI1bnerG7xo/iZC8zfdH
 s1ArxBmhz8Wq57hTtZZL0ecuQqi3CCs+k1QRIZpUrveRvKUnhs9TMzJ8ibLllqup1ZVygoFOkZD
 lVflej4Ayu/5RKTxHgFhGzojuORql4dlL7sPmfKZML0du+1nX0HqcWSpJVpg/hHb5tEFh07LjvZ
 o9fmQutmwuyq+4Jmfh+L1Cf2bnQIuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130026

On Fri, Dec 12, 2025 at 04:23:00PM +0530, Shreyash Chaurasia wrote:
> Hello Team,
> 
> I am writing to request assistance regarding a Bluetooth issue on my ASUS
> laptop when running Linux.
> *Device Information*
> 
>    -
> 
>    *Vendor:* IMC Networks
>    -
> 
>    *Chipset:* Realtek (identified via lsusb)
>    -
> 
>    *USB ID:* *13d3:3612*
>    -
> 
>    *Laptop Brand:* ASUS
>    -
> 
>    *System Model:* ASUS TUF Gaming F16 FX608JH_FX608JH
>    -
> 
>    *Operating System:* Linux (Kernel 6.17+, XanMod & stock kernels tested)
> 
> *Issue Description*
> 
> The Bluetooth adapter powers on, but Linux reports the following error:
> 
> Bluetooth: hci0: Failed to read codec capabilities (-22)
> 
> Because of this, Bluetooth scanning and pairing do not work at all.

Just to note, the btusb driver doesn't have an entry for this chip.
Would you please retry after adding corresponding device entry to that
list and setting BTUSB_REALTEK as .driver_info?


-- 
With best wishes
Dmitry

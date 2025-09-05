Return-Path: <SRS0=hCgi=3Q=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B16CA1013
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Sep 2025 13:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 740EFC4CEF5; Fri,  5 Sep 2025 13:42:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8650BC4CEF1
	for <linux-firmware@kernel.org>; Fri,  5 Sep 2025 13:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8650BC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856o0Y2032207
	for <linux-firmware@kernel.org>; Fri, 5 Sep 2025 13:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvZdeuEi1+uWF1IVOxannMOrGEwDQ4LImwshqiJ+VfE=; b=IQv6UAkbCqKOBY8A
	c6iXg1mQb2oW5dQKWRBawaJw6SKFReXjXskLqmQNiS3JNjDJ5zOCNirXFD76tp4c
	2Ess0NCQG2dPeU++UDY0Pqyve9KBYb+Bu0PbdZp0zdBBs3FBsPGR5BfgicpIFYr5
	x9wOXvm3jAhuOqmWIwE8/pt4e+YnIFD1DQCxWEXQe7udcvESeWIqmRjcQMexULWk
	bf9TY4pW4asDJHp+bca5Zxqs7h6XjFVRvvB/sO6tGh9MlTVDiF11BnpUYIxvd3ou
	T9STbRjCgCy5KYLEKbDZ2uFlEuppe6ts0tXxwKuRw7/BeZJLilmI2X5/vozpTec4
	1hh0fA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpke8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Sep 2025 13:42:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f31ef7dfso5251071cf.1
        for <linux-firmware@kernel.org>; Fri, 05 Sep 2025 06:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079739; x=1757684539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SvZdeuEi1+uWF1IVOxannMOrGEwDQ4LImwshqiJ+VfE=;
        b=i2XrT7andGdnoglNHx3Jrc22dmVGGsSebBPXGA4s843E5Z9RyyUHRwNAm25xoODewI
         jLhcjvhttihNMG6dIhTTNGqPE2eKU8wICJ6PuEevAR0Qu1fxo5FGCTKNO9vfKp+kBlU6
         x73g2LTF7FG7fxiWG3Gv1ckEOaBXXplj2RZRocMMCJH38RszX3i0ADJu4fqwELkEVj93
         yonJN8QxgR5dxImV+YfsPvrAUBTMKQqpVxwnIjr9MIcbOrdoHnlTVaFgZDckDh+dUgkI
         yk/XkmukQZ5FRTGvj3hfkn8DW5fLYhkZTkq8/rqAVLIZjqMeP/iEb+8NGhPZbPVRwy/F
         VI5Q==
X-Gm-Message-State: AOJu0YxmG4YVClFtOWuEJ+WDsCqhpY3zeBalRU0gNBEXLV6z0Xh0BIzU
	OzR11D3kaaV/hFuouF8q+tXY2vWnsxK+7VrL9Mb6FhGzAj+rPsaWybif73nyXyVKg6KkFVpFlM8
	P+Lh1Hiocg6MtfapI+Oc1NxTFh6dMs8U3mgbkLEcFWr6dBg+Lc2C4tYtkBpKwHZuRFes4wEY=
X-Gm-Gg: ASbGncuMA9JT9GgUm3XflZJwzbsogObWnU3edqT3XDBweIt/RN6mA3jqbd+BSenIjZX
	zzsFjwR98WT4YFbcObvpnAnrfSIlINTEkHD5Y54MIoSXYNwZ3E2bWyW8+2KPlZ/ahnoMvd57bR9
	1qh4JDa2VXoDKzztzYpyXnKwksedt6BSTkceCsCskhuZ6qYhcle0ZMbitqeIxW84bkBjaLR4JpA
	26h9Csu2axkLZ+kMbC0C3pyiv53vnboKP1wh/cp/eKZtVE2NKPgtWB68VamExPkiEDuVIKNdBMW
	7NY4eQXqo9CPVa62bGfnCYArE83ggNVBrUwxhZ88f0h5yATfUEQ3L200dQO6nPRi3yHIi/Ej4dj
	8gfe9Ef6w0sW0IjDl1yCUSJM6g9xWD2ppZ9eIsWwJVnCHj0CXGcIh
X-Received: by 2002:ac8:7dc8:0:b0:4b5:da13:3b86 with SMTP id d75a77b69052e-4b5e7d0cc31mr35306161cf.15.1757079739451;
        Fri, 05 Sep 2025 06:42:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEysMyxtRMwwXDcnLoBwtxndLJf0vw9wCSojzO3KZfI1ZETatD4aGqiB0QIfbTL5yK1XerpPQ==
X-Received: by 2002:ac8:7dc8:0:b0:4b5:da13:3b86 with SMTP id d75a77b69052e-4b5e7d0cc31mr35305681cf.15.1757079738801;
        Fri, 05 Sep 2025 06:42:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad2e35esm1756079e87.132.2025.09.05.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:42:17 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:42:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add CDSP firmware for qcs615 platform
Message-ID: <w4uprcv2dvzojojm2sy2vc6i63m2v6f2cwrf2play765w6pzaa@lzikj4gxzdoy>
References: <cd3515c6-5a63-40e7-8399-84de460b2f5c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd3515c6-5a63-40e7-8399-84de460b2f5c@oss.qualcomm.com>
X-Proofpoint-GUID: in7KpteeSp7TJwl7k7diNpBTx44uLdpo
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bae8bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=xwiQbOibaR5V078_9_0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: in7KpteeSp7TJwl7k7diNpBTx44uLdpo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX1YNg6N3e5RIW
 Uh5Pkv+fHimbVbyOsqDwzviYxw6MiPUxiKndd6Rzg3oUZirBJ6IYbpYXaH7IkorVxj90UxNlw1N
 afq9Q4bObT+RNIGInv6gW8g7s5ZHN5KV7xbkTHlQR5wO33Y3BpsaAGtuV+qnGPmgAc+vmkK6btZ
 VkDQGwTHaNZYLW8YIADPACm3jRjuTo2orVlAaDy8Jhviz9u7lB4DC5Nyw5Z92cH/EewnBIsQAlk
 ImeEVqyecxoGGUjrFwbBpuaS7W+8rL2BFqg0+a5cQA5JWm1ljxAwulvB/8xce0jbi5DY7q01aJv
 5Lwq58Zntem3QcyAYQLl1qhfj1jFVNh3gIZrd2Q7jI75fmbL8obRFZS/rxfr3RgbToCqUuN+fFU
 iv56CygA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Fri, Sep 05, 2025 at 10:39:46AM +0800, Xin Liu wrote:
> The following changes since commit 577ee67ffca254fe7ee3a7dc5bcf0b8f749f2902:
> 
>   Merge branch 'robot/pr-0-1756931524' into 'main' (2025-09-03 20:41:46
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qcs615-cdsp-9
> 
> for you to fetch changes up to 82b34c45e9ffbc2894a7a870701c24ce9a30e734:
> 
>   qcom: add CDSP firmware for qcs615 platform (2025-09-05 10:08:14 +0800)
> 
> ----------------------------------------------------------------
> Xin Liu (1):
>       qcom: add CDSP firmware for qcs615 platform
> 

Xin Li, could you please also submit ADSP and CDSP Hexagon libs to the
hexagon-dsp-binaries repo.

-- 
With best wishes
Dmitry

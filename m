Return-Path: <SRS0=mgKc=YD=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293B3C3ABD8
	for <linux-firmware@archiver.kernel.org>; Mon, 19 May 2025 10:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A42BC4CEEB; Mon, 19 May 2025 10:22:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C167C4CEEF
	for <linux-firmware@kernel.org>; Mon, 19 May 2025 10:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C167C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8mwUw015603
	for <linux-firmware@kernel.org>; Mon, 19 May 2025 10:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QRcCypPzBsUplJ6hbXtPMFrKi5MP8Dn2S1vQpPvbOSY=; b=RYYss9G3BEhOFupt
	OVkf4HBscjttiFncw2dBJ72+ulPCB0TTR90NYrlnsWi/UwlRqUihHyYU4QObypVR
	Oo92ur6UJpY91FvWnIwSElKYlLOz9BrNlnHEkvVSLG9Ev+ZQsz3j9WL4pT9GoL3P
	xuv79c8hURMHIsCMGZxWMv+ehP8SPo7InmwhzTIUCzmpU0gWhlZnET4KCZ2qu3yG
	I1v51+Ing7Y9MMSwy6zZXq6umHixLW7FJC65U+27Ft8WG71+MfabZyUoJ5QHYe0T
	QhwiQzIhR2mJ/3uQPKngkKKKhQaZWzYUpv8fI9CBbujXr8/VmToVnLg8+tpx/S9+
	YZhxdw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym144-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 19 May 2025 10:22:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8df8d4585so4701466d6.3
        for <linux-firmware@kernel.org>; Mon, 19 May 2025 03:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650145; x=1748254945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRcCypPzBsUplJ6hbXtPMFrKi5MP8Dn2S1vQpPvbOSY=;
        b=s4ftRzG1x1B17jZ+joeD0P3VrG2IsTknVg9sTp6b6BMCys9juGPXJSQXElksKNBrYQ
         kyaIOCI9zYrwN0ufF+0dzvgXTvI1fczU/t9J/ytyWe9WBS99bsv9Kg7efJq4fvhjJHGC
         O9cLmAdIIygI7GkDedk5YoTM8BhWEhyFQ6THFcROGu3YgKT8ht28C+QZEjxEwzeNwYy4
         i4+xmXCWnqaLkfszdBwn+PaBdpEEUP3KUWYzV2irs3KdGGt4FbLGBeTcuxmmJvS/DIw5
         cmm6F2r2GojfsOYdodJ7rOrqGwoMrVgF6zTEagS0HGlgdTB0NCL0q6gKqoNHSzF20idB
         Ze3w==
X-Gm-Message-State: AOJu0YwTzJhn8JeNLX10g3Azv5z4NtKdTlilBG5z/VHX5yfr/lpSWLLM
	LvpxRsHtat6q18AHbI//BOWQZfkJlHUUxmfQ1Sxufx0bE1SLs3QgKmUBQicbLK/va28FGyVdC7C
	3ZG3zNFKUbKCMvL70KWompU+8Bo0oVI18vTzojB0CrpEA3EEEsjrkFELcs973iIs=
X-Gm-Gg: ASbGncuUbjYEPfc6e31zxFc9bp60GyhR06urWhWN18M/I5rFixShGkc2n/hD3VVVtPf
	08HblCXpy7DFcHEgrCLnSta490SNbUXnEKNfVNF6AKYHmVmFe8ylL1ID8o3z2EvTE+yp2taFCW8
	eCdFip3zf7ws5lxyYSb+A0EKZp2ZsogQ9A7BHj/lXTc7X1wHFvpE4FbVev06V7lhKstyNpAyUzQ
	400ya7tyLz4x6Y/CKRVW5MV3kl4XP4HRL2grv/xt+VyyrKfTdajfiD/H8vJF3Upr4i9aqG0/ymD
	WTJ1F1adTZd4UHlEq8MzCMle2sYhruSlF19dIuVH/lWe47HtgX9a4xvFJiDB4w5Y4GJnqjrqYUc
	=
X-Received: by 2002:a05:6214:c68:b0:6e6:646e:a0f8 with SMTP id 6a1803df08f44-6f8b08698d3mr212360666d6.16.1747650144993;
        Mon, 19 May 2025 03:22:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGgBowDvQ5eCcKtpbbbxlKt84Q6sjN0S+qBrEmGw2dCoNzlQX7mmiCj0n+m0JNZ1TNaEMrSw==
X-Received: by 2002:a05:6214:c68:b0:6e6:646e:a0f8 with SMTP id 6a1803df08f44-6f8b08698d3mr212360346d6.16.1747650144579;
        Mon, 19 May 2025 03:22:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f39sm1798800e87.151.2025.05.19.03.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:22:23 -0700 (PDT)
Date: Mon, 19 May 2025 13:22:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, mukesh.savaliya@oss.qualcomm.com,
        quic_anupkulk@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: qcom: add QUPv3 firmware for QCM6490 platform
Message-ID: <diiztiu3oixbdx3x73th4z5nnii4gvb2caauxrrbvo25e55wuy@gc5a6utum3sp>
References: <ef16e66b-9cb8-4062-83fa-96b2aff1f0ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef16e66b-9cb8-4062-83fa-96b2aff1f0ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5OCBTYWx0ZWRfX2nju0hz4wzUa
 p0poy2cjkciJNkYH1Wwva3Suu/Y8ywxC3frs7BtV9hWN4BS81GXfuJPp4rgUuMUWdjpxAWoySXs
 7dNeT7xoiBu//tml/BU1y283JbgW/9Zdmjck5SJ9RPqeerEwYMDVnMFDFD6079IAlRK+pNKZlF6
 yWLlhXbw87Sou09qFAl/5ymuC8tkEbavQ6bDDiqJbAPuPIcWFc2uYZezqJfUIh3gSK2/8gwNNEv
 myL8rYzPT0gWgXNgsG+XEQy0Tp37iv+ixXmdHz4PpkblvEN+XoFpR+djmqgxbq+F1RrfGYJP7LO
 EJ8J5T9Yz3PWfxsHORY4NECzKy6+ESQFSL2tZYn4tgoCpEVXGJlEjorGD1O9OMvbZmKBHH5kXi1
 5J3v1/pwTFXGy66/ichvKaV6EOdxnZPIkdB47L2+3EY/AA9jAUh2ExlINLqtYa9cKnDmkmW1
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b0661 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=ajKqya2mJOxvy7CF9VAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: n0N0Wamxk7JNEJ0MVqy5DfDSmd36sunk
X-Proofpoint-ORIG-GUID: n0N0Wamxk7JNEJ0MVqy5DfDSmd36sunk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=875 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190098

On Mon, May 19, 2025 at 03:45:28PM +0530, Viken Dadhaniya wrote:
> The following changes since commit 759c4acafb4a80d76885e4a1542229a27d677322:
> 
>   Merge branch 'robot/pr-0-1747425243' into 'main' (2025-05-16 19:59:07
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qupv3-fw-qcm6490
> 
> for you to fetch changes up to 29f3300a797063fafd32e1ab45badc12ea81feb8:
> 
>   qcom: add QUPv3 firmware for QCM6490 platform (2025-05-19 15:05:34 +0530)
> 
> ----------------------------------------------------------------
> Viken Dadhaniya (1):
>       qcom: add QUPv3 firmware for QCM6490 platform
> 
>  WHENCE                   |   3 ++-

As you are fixing the driver name, could you please fix it correctly: to
'qcom-geni-se'?

>  qcom/qcm6490/qupv3fw.elf | Bin 0 -> 57269 bytes
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  create mode 100644 qcom/qcm6490/qupv3fw.elf
> 

-- 
With best wishes
Dmitry

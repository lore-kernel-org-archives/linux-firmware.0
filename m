Return-Path: <SRS0=fUOl=52=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D9CCEE347
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 18:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18E55C2BCB2; Tue, 18 Nov 2025 18:02:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BBEEC4AF0D
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 18:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9BBEEC4AF0D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIG3R883176704
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 18:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uHwHUwh9S9LZrWwpL6sHa5NR
	fmSp0DlCGLZug0CAVJc=; b=Wimj2nmffgKCQjpt9778iveAVTIOsH8jIAqK9JUO
	OP9VkHunICXgbUfXxptTHN7hobXE8Jn0vXJYvqjNFKe4Hhr51Kr6n2GclxERzJYM
	k0Qm1fwSk4ZwvUWgP2JSolmlWhW9lJIoAsJMqBvSspadQo1elFQHmYnMsSl4HoAe
	1UDOR7RNUmNCDCaX638J14qi4D8Gm5Z1Ab9c/cFn9Zldd4oDsIgxxPOkNTyKU942
	sFPHG2U0pfq60Y+IiLvLYvwFNWg6dPmhMzVoAhZcvcDAzds/NZ/bUunSTFXMPlgy
	oG4S+crM/Urs0qsh/I/Csxk9CGWLb4+v2eDIc5RiqfMoWg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv020dv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 18:02:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-559e9092276so4040984e0c.2
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 10:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763488950; x=1764093750; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uHwHUwh9S9LZrWwpL6sHa5NRfmSp0DlCGLZug0CAVJc=;
        b=jPxKxTGrLf2B1QODLCyLp6tc0UCVK2Uv+BVkC7E6FHgZLLamDIqcsnRZMpnxbSjUSW
         KAYoTNy0++Ls4/HNJlyMO8Bp8SOGorzXfZOMlF6y7CR+0Go5zMQCAQRgrGAZLnZqjqo/
         IarcBT9LqcEQFVPM2metwX/2PRs+FaLmzyaLI6KaR6ZPAj42TPOCgs4CYs27IYWtJc1Q
         KB3NZd5tWbJDxcOjzsWoqKs0rbRbaqpeSU7ro89PPGBNRwI3/UQbLHjfaTgSbtcDtb1b
         SZMj5/F/X52QOH3rWpW8+nrTpU2AQb9+S9/+Sdh82v9I41dOAlpSHcrak5EMOKqzoQbJ
         NASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488950; x=1764093750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHwHUwh9S9LZrWwpL6sHa5NRfmSp0DlCGLZug0CAVJc=;
        b=epOyEPGlUWFSwWYQjI2CL5aKJ0g1jRm1LJJz8EYH5p1pO4DXrphmbNk4sFORIOTDfa
         400hLKPzn/AQbT8QfjOLfgUeJN/s9VpdEMEj0q1jSCErFj4n3o3R3obu571PmVVOQCQx
         TbUkUilVkC5muSJx+qhO6SKBsljpfdDewlaX4dDDcCbFpMxpZRPv97F4kOSjpgUF0W91
         z/bMg0Hu9w15n8aXSYZalq7ZwL9AUi+3gYXEUmplqgKxixn/OUA7Ru4OEFkxFfh6FKMO
         ZiZhKC0XaCjqd8zxiCaPKdXpkZnPwuY4hfbFe2CjhxD4ozL/xs8A+N84nogJHaVmgtYu
         2yYQ==
X-Gm-Message-State: AOJu0Yy0pmU7n7M+CtDs3ptTFyGGi2l7Q+SL7lbRHof4NnZ65v5phWNs
	kC/JGuGLO2VM7lI3TAXH0yxABzbriYLtp6SHXe3AkUTZWweNTYG9Vq1mWov6quZ9J5tisFULBAa
	pF94jOvuz8ezlh6B/3MJD6v/+bk7Kbd9nruf+hclIykruSA/4WPzypqb0Aq4p9lE=
X-Gm-Gg: ASbGncvNELQEoExI4aD3ByW1EcXwWscn0QHmPld/E8hb9lswX6rIFowcId7PnzJ9Y/i
	bZv3v+LHZ7OGXOrXvnBHbz+Xn5kjuNCNgqGk23dzTWMKjC2/9wjrBmyOvWrQ02iYpAQmLF6U4rH
	4qdS27K4P2zXUVqTqPNwNo31g3GmIdQR5mHuxtroH0dSbKX6bM3Bn4bDOjOZTlErOh41OuomqqU
	C7sKEFhq38SQJEh0v/s8RLUY4JqwcDJlLXD+L1iClzsJXxufpAbC9tcd0+is0Y76909+zqllaCd
	BUX5i1NNiRS0Vmi8YuE8RvozqtOHiWbYq7OqGeDZVnidFbYieVgT8hA1oHjEm8HhC/FkIHYB3fq
	UPLRs78iT9oo2m3v+6MabSyplAjVD1vbAUW8cdmbeMFKnclGLzb22nhVzQyp2RjX25MIBOwTa0F
	wF849PoC/cIGKF
X-Received: by 2002:a05:6122:888e:b0:55b:305b:4e39 with SMTP id 71dfb90a1353d-55b305b735dmr2501644e0c.20.1763488949179;
        Tue, 18 Nov 2025 10:02:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3+lHNzdzzu1lbKJ9d+qp8aQu/X6yPNdvE5oGGnJ1ByveMnfXuZFCJHMKLjT2Lcr9DyLdn/w==
X-Received: by 2002:a05:6122:888e:b0:55b:305b:4e39 with SMTP id 71dfb90a1353d-55b305b735dmr2501610e0c.20.1763488948718;
        Tue, 18 Nov 2025 10:02:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac925sm4099749e87.10.2025.11.18.10.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 10:02:26 -0800 (PST)
Date: Tue, 18 Nov 2025 20:02:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add ADSP, CDSP firmware for sm8750 platform
Message-ID: <4ttpemstqrxpfuawwap5mza7lb2v6bzbk5iyipma5toczszocv@xnrlggk5l27b>
References: <ed9a4b17-c97d-4e43-8e73-444d9a10ac08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed9a4b17-c97d-4e43-8e73-444d9a10ac08@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IrhpEAq8nLJvpTCJf1tzvTPjGwdZ6Uql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX/J29mK4cMZKx
 8b37OX38Q3lCBSQgQNmINfxGrMm+aVTV1QF4AKYSdVPLb3x93Jb23EH13d46B9wxmXyGphKe5rr
 10VgnJB15NdLCEVCOWcFZw7WesCjRDWAx0ZgW4C/kAjP8qEfdSDiHg81VXVyOP8mfWDrt3+5WRT
 d302FvmJ7aQ5+jleDYYco2JWW849sEZvSFq0vL+ackL3MbEoQU0/ClX7owRE01ONrCqZ1XkFHZU
 wo/EXhsWkTFj+zCIA6rGj+TYDWWAwn4S8+49Dy9jt6Ogfw2eRYw/f8k51G7YKlN7WOqp3I8Mvwh
 eam0+cCBOpX6nLJRlJcZWV9jq+7ldZavZxZZQZTSfB6fyXyV/QBHuFyJrwfzP9SLMrU3afUMAxR
 3AZruDAGqpSizDgPb2RmM7l9IzSadQ==
X-Authority-Analysis: v=2.4 cv=ad9sXBot c=1 sm=1 tr=0 ts=691cb4b7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=FMVDTVIysvXbxHreTSsA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=fsdK_YakeE02zTmptMdW:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-GUID: IrhpEAq8nLJvpTCJf1tzvTPjGwdZ6Uql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180145

On Tue, Nov 18, 2025 at 10:08:59PM +0530, Venkata Kota wrote:
>   Merge branch 'robot/patch-0-1763433586' into 'main' (2025-11-18 12:18:24
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-sm8750
> 
> for you to fetch changes up to 094f6b6193169441da53cd1ee54d5354e444fdd7:
> 
>   qcom: add ADSP, CDSP firmware for sm8750 platform (2025-11-18 22:02:50
> +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: add ADSP, CDSP firmware for sm8750 platform


Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/788

Please be sure to submit Hexagon DSP binaries to the
hexagon-dsp-binaries repo.

> 
>  WHENCE                   |  12 ++++++++++++
>  qcom/sm8750/adsp.mbn     | Bin 0 -> 19421576 bytes
>  qcom/sm8750/adsp_dtb.mbn | Bin 0 -> 180024 bytes
>  qcom/sm8750/adspr.jsn    |  22 ++++++++++++++++++++++
>  qcom/sm8750/adsps.jsn    |  22 ++++++++++++++++++++++
>  qcom/sm8750/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>  qcom/sm8750/adspuo.jsn   |  22 ++++++++++++++++++++++
>  qcom/sm8750/cdsp.mbn     | Bin 0 -> 3912104 bytes
>  qcom/sm8750/cdsp_dtb.mbn | Bin 0 -> 36664 bytes
>  qcom/sm8750/cdspr.jsn    |  22 ++++++++++++++++++++++
>  10 files changed, 129 insertions(+)
>  create mode 100644 qcom/sm8750/adsp.mbn
>  create mode 100644 qcom/sm8750/adsp_dtb.mbn
>  create mode 100644 qcom/sm8750/adspr.jsn
>  create mode 100644 qcom/sm8750/adsps.jsn
>  create mode 100644 qcom/sm8750/adspua.jsn
>  create mode 100644 qcom/sm8750/adspuo.jsn
>  create mode 100644 qcom/sm8750/cdsp.mbn
>  create mode 100644 qcom/sm8750/cdsp_dtb.mbn
>  create mode 100644 qcom/sm8750/cdspr.jsn

-- 
With best wishes
Dmitry

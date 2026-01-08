Return-Path: <SRS0=UU7q=7N=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705DCD185ED
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Jan 2026 12:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30595C16AAE; Thu,  8 Jan 2026 12:48:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6055BC116C6
	for <linux-firmware@kernel.org>; Thu,  8 Jan 2026 12:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6055BC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608B2kqI1970079
	for <linux-firmware@kernel.org>; Thu, 8 Jan 2026 12:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTTbSp02DZlylrCS5gVCCeTU9vgLgaFkY/IWhT8KCHg=; b=PBOew9b2g0iCXq3a
	t0aSrTZ9kzPUJultLiWs2jrU/sv79/dYervhQwhQEi6Vpfii+J2eLeeo7UXq7udY
	0OYeBNd5R/d2WA/A72FE7wVt3S3NM/jDLyVaur9CFcmPAOMIjO+IxPLpVOrS769D
	t64K+i0UO0oKJJUKdnrxWQD7iQmIR1wihwUOBqL4+EftUIvkG9H+Axx2OfLL5HYO
	rF9pD8gkdS6iIz6YsLCwlijCDfilDU2fpIzeMH/BCq1z6etDtFOUR18YQ34dmOKP
	QO2F8EuXIOjYLyknTXn/t922aDlKHjRzrZgrVukV06pzdkYyvEFYrue/XkMAsgZZ
	yB6Fwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjbc4r94j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 12:48:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e19c8558so733398785a.2
        for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 04:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767876487; x=1768481287; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OTTbSp02DZlylrCS5gVCCeTU9vgLgaFkY/IWhT8KCHg=;
        b=Uo1i4O7baz+JHc055PHmUV81j8fWjQbTQrAfWxmbwMPtjsNu/Augj20HLEaKZI+RO4
         iHBR3fwlHmL2u3OCLr4fZEEzoTwP4i9HzyqKtTL5gN8cXmA/PLW+cyVy2M5CJYNahPMR
         iwFp2+MAanc9SScSb6m50lX1Cqr+1xjimZEYcTCQ8QnOJqn4tUbgulyCzBosOuhIXyr0
         1nxol+JNpnWY4yK9+FAUX9FiM/i/PFiGGphLHuoOVj7OBz4indI8GyHpWRCuqEe3WEM0
         pWtTbU3dLuUGRULD90eQOpE688FAa7cPvX2sXf2D3vaf7hWazYujEUgbt0S0yBtUf0gR
         z1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876487; x=1768481287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTTbSp02DZlylrCS5gVCCeTU9vgLgaFkY/IWhT8KCHg=;
        b=HKdeQxY5bziBPTj71WKFbMFWzfXucFSpwsVldYW5RR23GFbH4BaHxbFnTrUQNIwm63
         wGBQa92Zvms7/f1URQvKz/a4RMl0TKGQOTR813qX857/FmOKaKZua+2BB+PMUmD/Ox/1
         2tO6f7U5AA+KKGCkHYUVZMM5EKZLy4vNQO8O1p7T6T280utPf5sfMIbVc0RG7madQYh+
         aghB4m2V827HTa9LER2pWnrWk+0w+6V7O6xwJpcXuem31Ph2/I9BaabxXyzvzO0DAWlk
         2KQ0N0LjRaYMsGoSgk7CPlbtNyNL2girZkWWKQyvMiStHRy1bvS8MAWenCQsZXBHMlzS
         f1RQ==
X-Gm-Message-State: AOJu0YxTDCs6LDhz13lPZJBax4Zl7IUdM26xELULbA+H4Pk86GeTucPK
	6+iYDSjYPVWasiAvTyFC7aRxv/zCwAXtzRT/vGackeIvlHzOqjTRfgx8v1ioCx64mPj9ZVwG5eE
	I0kzHx11lSplapslOpBl40BeprG3SU4JO6/Vzvcv476lsRx1Ub+cCSDLakwT3wd8=
X-Gm-Gg: AY/fxX4iJVBylraUFU2JMY1a+2pEr97UhJULOUntdyOhnBtHH6fC4szTvfopDaXgqzP
	R8Iw1ZyntG7wKgME/Z0nejgog2+vvCE+09qlt7c8O10KeQpgraoaOhlN2fbIJEENAekNqL0xtma
	Hjv1KCS2HsRBiXCyiZpP5fNgJa4Y/4fOEMaQiv9/BhbdwmcB6dLHNYYRx/l3zZ+rR6/ndeSQTkO
	83HivJtk4ZQNh1RTSp242KAX0DMNB9NYBHvKh1LTc3Qode96el0AskZ+RBhSA6bA7dOhQ3PDlt/
	mg5NPDvkc6rUHGjb/1sZfVcSY3aY3/1k8eLPiXx3cvgEThD2wO7KiCsJwm3np+8SuLDlIyx0yOG
	WATTMZ4CJr4GupejFvd4vxmNnvAywK4kPaCpscjB1DHzopaxRL0ZWAHZxZGyLCFwK7v3Dk3BpN5
	aQNbw2ysHoH+51xm7O13tg/aI=
X-Received: by 2002:a05:620a:708e:b0:8b2:db27:4268 with SMTP id af79cd13be357-8c3893f5291mr694929985a.53.1767876486644;
        Thu, 08 Jan 2026 04:48:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/BlnpLrYuW/o2PSzVpg+HbchJL9HYQJiCzseKQyRvag9jLJea8kVR+FFflSDZxGUeOhUhWA==
X-Received: by 2002:a05:620a:708e:b0:8b2:db27:4268 with SMTP id af79cd13be357-8c3893f5291mr694926485a.53.1767876486175;
        Thu, 08 Jan 2026 04:48:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6addaab0sm1662600e87.28.2026.01.08.04.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:48:05 -0800 (PST)
Date: Thu, 8 Jan 2026 14:48:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
Subject: Re: QCA: Add Bluetooth firmware for QCC2072 uart interface
Message-ID: <lqvojfgvfubj5gtsqksyzndlzfabrs6oqexoz2tb232opeqq22@s3k5ur53oecl>
References: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PTBNLFR9Nx3J1-j1j_fWGH3619KghY2l
X-Proofpoint-GUID: PTBNLFR9Nx3J1-j1j_fWGH3619KghY2l
X-Authority-Analysis: v=2.4 cv=fdegCkQF c=1 sm=1 tr=0 ts=695fa787 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=C15eEx-zN6zWdQ1evr8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5MCBTYWx0ZWRfX1GFI9+fBAEXH
 KaY6HbSo0s7CK+ovi9dFtbgJEG8NoDPejuDmU1s3QSeIghM3RtlEGZAempIMlipRqPBRv3DJ/Eg
 sZ5UvCPOv0uWS7Zu+s4J+w60DXFf3L4xhInH45BIE4orwz08tyTqtSOVxmOQWCSCVV9igeTp2Di
 xq2JTZBgXVhENbI+sgfev6G6HmuKjffawra52ahROlQ6U6i1xgY9HWBLENrcPH2BVlH/MU3nyGI
 R5bYwkUgx+czgRo/xx3sQ4o6vCQDSF+53upJHJqNZM5zEmkyqPEcfO25/lkfswmKPxPppCkBunR
 ZpLeMmJX1+0ypFPb3NF9Mp7JTgx21aS3yORx4zUjovlJ8uQTkswYqhsRxX3GEbzbQu3mp7OFBtd
 qpCwwl+w/iJcTIIlRgdgwnpgZGlpKVA6frWg+lK4aNZ6hj/fA++1jKa3wcMaZmZuvosaHS8HJtj
 +rQOhexAOy2M5Cmr05g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080090

On Thu, Jan 08, 2026 at 02:33:22PM +0530, Vivek Sahu wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if you
> have any problems.
> 
> 
> The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:
> 
>   Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
> +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/vivesahu-huboss/Cologne_FW_Upstream.git HEAD
> 
> for you to fetch changes up to 5fce4edd5a84b09c670918cfcaa0705eaf1c2b60:
> 
>   QCA: Add Bluetooth firmware for QCC2072 uart interface This commit will
> add required Bluetooth firmware files for QCC2072 uart interface.
> (2026-01-08 13:20:45 +0530)

Please format your commits properly. You got subject squashed together
with the commit message.

> 
> ----------------------------------------------------------------
> Vivek Kumar Sahu (1):
>       QCA: Add Bluetooth firmware for QCC2072 uart interface This commit
> will add required Bluetooth firmware files for QCC2072 uart interface.
> 
>  WHENCE            |  10 ++++++++++
>  qca/ornbtfw11.tlv | Bin 0 -> 216274 bytes
>  qca/ornnv11.bin   | Bin 0 -> 10880 bytes
>  3 files changed, 10 insertions(+)
>  create mode 100644 qca/ornbtfw11.tlv
>  create mode 100644 qca/ornnv11.bin
> 

-- 
With best wishes
Dmitry

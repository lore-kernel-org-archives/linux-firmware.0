Return-Path: <SRS0=ukHP=A6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCEAFD8FC0
	for <linux-firmware@archiver.kernel.org>; Thu, 26 Feb 2026 14:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BF18C2BC87; Thu, 26 Feb 2026 14:53:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F7AEC116C6
	for <linux-firmware@kernel.org>; Thu, 26 Feb 2026 14:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F7AEC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL4KC3747745
	for <linux-firmware@kernel.org>; Thu, 26 Feb 2026 14:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fPHCs6zIMRsmucu0OPr1pbqa
	cIy0yN9HVb7DUg4JLew=; b=iirJXepTcSj86wNhe8o5kheXajam2lmWX640xYWh
	Ro1RSa+grZKBpEN2oaDHIvMRAO+uzdjVBY4Ww9pXshdF+qPceBJOIDYoGlp+tA3l
	8CYL26f3InJdP8ZGPmQUe1Cu1orK05LN9nuGBQ9baNYVtvGIw9YVB9MuXGSWRoMq
	jJDh8YDiZQnPm2oGRPSYTHJD8AdDPgh4WCJ3RgoKfUTpJpa0FXv/hqqFNwY2g4R8
	mOnFKo7PGfR75Dx+wZqPwT4IB5MZQ/aleM7SMDiORLlUCsSNdQwmSOGPuj73XmQa
	bpNk8b7BrAuc/s2ZEuHYz/RBszbJypBg85gCygsvH5BbjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559kk67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 26 Feb 2026 14:53:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb42f56c4aso810923085a.3
        for <linux-firmware@kernel.org>; Thu, 26 Feb 2026 06:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772117604; x=1772722404; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPHCs6zIMRsmucu0OPr1pbqacIy0yN9HVb7DUg4JLew=;
        b=AW62RHAYdmr1V/5sjUh0RqD0LqBd7qfsjRB3RSoDwwX+sLpCEEp1262/fQynCAXfND
         36AlRX7+m9mZ9lOlIbJqtQAmeFWZHeuzaEZWKwLZncq/pGXW1bDHqMESFg2wZMSkh3B5
         ZvveLOVvWMg2/XkGC2Qnn8NYiy9EtnwQSa6bX4pao9MqUIX6zMleyZb2lV4fJcwr/A2N
         oXWXQdOPPXynDsJe46FznmH8cJ34h1EG9YDyyRfE0MPP0a3q3Y1N3B6JUfACET1Q7l5t
         Uee3OUMfJVxy9sm9DjBRfGum67UB9i2nkLCLKLcHgYt1ooG/1O+z0NmxhGLJIgTg39is
         Cg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117604; x=1772722404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPHCs6zIMRsmucu0OPr1pbqacIy0yN9HVb7DUg4JLew=;
        b=mlH23uQUBh+sED+iymXScc8C3zWUyDlOFd9qez3xL2fLLArozUnsKZi4YVn1En+jWS
         UOKpz8NpcIrj3w8OpTBIcku15lnju9GTQj7WoqUwvVYD3A+tS1QIKuWjOrnfR/er7kI/
         JyuM29XkGn8KTsYQqp4PAFKXb7Oc3J4gNwqrF2/+qA2ifM/N/N0lgcDVKe75AVs9omM2
         JjXCFS0Q1FE9XNFthlOJaMMeL1lvQ8uy1LhMrHFAB26xnMp/fx3p398jR9/6rkaH949T
         XzTccqETcVuGCT56Ck5QHtzgwkq0mC8BSjRhfjUopIanECCey74bmNA/fZ3xWd/jkXde
         seSw==
X-Gm-Message-State: AOJu0YxhjR8hkLDBJ/ryXbzAeN9H18WCSugceZBkC7a5WU0icaQg0iCr
	kkdtrv8wju+Kk5Rfgs6dmxBnD3rC/Lve5THG7g+A+gIdqRrWZBuu0KGWcYpDE0yz41kQUFac9Mc
	4JCOhOVM7PjPEx5ly/kZOesXK69o0FNdSOO5aJNRsrQXBKk1FFehhumsKXdQ9Nlw=
X-Gm-Gg: ATEYQzx+3/A/TrHCOd1fyduSRQahu/Tj0IFAFp8GSUY1O4fM4sVo+WobR4+6qiIuZ4P
	Jni61wB8fKykp2dX1WhhgERaFIYz6ERRM3/0xABKSy1T1oMiZE3DBzmXklwc+Kn6rmBk6LhUWN3
	A7aGWrKbRA01yhmg85JNqUKUwVKIZl+pDh90acQgxDMTNRIFUhFTBzDnn8VjslLnFi13MLaJ9yn
	7tQPRc4UH8sUwYmR3lMNZ7ziut8b9bWN7HeGVtURVAh66jfLpaVXVg+7fGAemtl5lLTGFaV0Zhz
	GHUeo1Y/RlkMD4YMUjzj2+eBYEgYMx2IRHmnvBI1Mw8ewiRqvU/wQLb4T53C6OW906A9gT/dr/N
	aaZ7g9qkfP6C0ZSPomQibmuCYXo41ek59tf6hdFOmBDh00r4ER699mwnubmJGJBcYsOPB0GV6+7
	hTrhZlbe8BEQidJl6HXBmqedPod88zmuxStgE=
X-Received: by 2002:a05:620a:404c:b0:8c6:b14e:655d with SMTP id af79cd13be357-8cbc11e027dmr276326285a.74.1772117604347;
        Thu, 26 Feb 2026 06:53:24 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c6:b14e:655d with SMTP id af79cd13be357-8cbc11e027dmr276322485a.74.1772117603777;
        Thu, 26 Feb 2026 06:53:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4aff3sm7105531fa.5.2026.02.26.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:53:23 -0800 (PST)
Date: Thu, 26 Feb 2026 16:53:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com,
        mohamull@qti.qualcomm.com
Subject: Re: [GIT PULL] QCA: Update Bluetooth firmware's WCN6856 2.1.0-00665
 and WCN6750 1.1.3-00106
Message-ID: <fdfva5k3jgqq6o4mtk3i4cmcovylzsihl6eyzgx4j2ytkua2zq@r5xlrzdlwgvg>
References: <82427fde-147d-4a4d-afed-a6d9e250cae8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82427fde-147d-4a4d-afed-a6d9e250cae8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TXUZB5uTzDiJ2z_dHoy7KAHCkbR0phWR
X-Proofpoint-GUID: TXUZB5uTzDiJ2z_dHoy7KAHCkbR0phWR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzNCBTYWx0ZWRfXzXMkD7zhAJos
 vdFTE1xAVnRobvT2mVlZxjiNegiamH0JOlVDNpIZ/5137lvnmrIRNkIfZlDyV2Ujl6syZQs6GhQ
 cMg5gKeg+isIiuGfOwyiuuAuevG9mGlXF3OLTAWZXMHrLbUzys0sx/Nte35dgeCh0pVTmXVzloI
 I55wtkrrVrlK1FcqDXSti2S4AkMdF2uGrXl1N1bwJnHPSC6YTY8x4x+TO6eR3Ed4KbNfz+3GFgr
 OQVJo5CF37y88GIv4WUNdBSHUZ9bdVD/D0AW2kC9dbHhvL0HIukY9z1G/UuqjDmyWdX39J5vTzI
 bQ4pgFXEbExDebZ5JpmLuXzvBoENXvSHH8Z4EiHse17rKvvD8f4ueqrHczQIJTnuFe3S823kut3
 MLbjp5hvVrn9TdyAGWYEbKqeojrFzWG1aXfR9hi5mwp/etkKFns48fTldIeBLNui5YtrmjBy5Cc
 28WkEcmnuaN1/gN1X0g==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=69a05e65 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=p0WdMEafAAAA:8 a=8jeWmWCn1zmj2pP7WBgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260134

On Thu, Feb 26, 2026 at 03:43:54PM +0530, Janaki Ramaiah Thota wrote:
> Hi linux-firmware maintainers,
> 
>  Here's a pull request for bluetooth firmware. Please let me know if
>  you have any problems.
> 
>  The following changes since commit
> 1db833e68de88cd3f7f6612a5552b3e671e36ef0:
> 
>   Merge branch 'remove-obsolete-lenovo-fw' into 'main' (2026-02-21 15:51:25
> +0000)
> 
>   are available in the Git repository at:
> 
>   https://github.com/quicjathot/bt_hsp_fw_2.1.0_00665.git HEAD

Merged and pushed out, thanks.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/939

> 
>   for you to fetch changes up to c12f408deb767416bbfb17d11b0cffdf23f07c1c:
> 
>   qca: Update Bluetooth WCN6750 1.1.3-00105 firmware to 1.1.3-00106
> (2026-02-24 17:10:47 +0530)
> 
>   ----------------------------------------------------------------
>   Janaki Ramaiah Thota (2):
>         QCA: Update Bluetooth WCN6856 firmware 2.1.0-00659 to 2.1.0-00665
>         qca: Update Bluetooth WCN6750 1.1.3-00105 firmware to 1.1.3-00106
> 
> Thanks,
> Janakiramaiah Thota

-- 
With best wishes
Dmitry

Return-Path: <SRS0=M+PL=BD=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3F7EC1448
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 13:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93716C116C6; Tue,  3 Mar 2026 13:37:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8A83C19422
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 13:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8A83C19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239moqN2773382
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 13:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oxfB3HBbmpVN4DFVHxhDpo7Z
	/qxkqIVvzrvJm+z8ZIg=; b=ml5NMN4ottpoI7rEBNZVxAwpyRkn+QnIBouGeqPg
	UjOtcDX0CT3pt+q71h1hi+LFfSW7OJtuiyt6kqt3t66UnXjgOr6ADciX1xFoI26d
	jooCmCLQmYr48R58jKfb7Z80MKWqoBiAFxCTPb+GW8BDDtjYlN5a7neDUujxlhdf
	zE8vhq82qZE09DnJyhExD7TB80A6eKTz3FlxyfdA+Nj+0/o/dn/f7YBbAd9LPWH5
	kxMzgkq72w+Wz3CUsN+n1Z9IBPaCwB7SUkGxCDdNa/56Soynsx+bAlzNRgupMyM+
	yaxOCndKP3A+gp6ICAmD9zL576ecRalNOu/yY8csX/6HKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm1ht0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 13:36:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71304beb4so406629885a.3
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 05:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772545018; x=1773149818; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxfB3HBbmpVN4DFVHxhDpo7Z/qxkqIVvzrvJm+z8ZIg=;
        b=AKSC8VXRlZbRMggGvzbcbkt7eSH+XxRwj83P8V7rhZzS0tr95CmkPqG5z+n+XSGO55
         M1mh9lwa0TnPb2H8rWpPQYPv7D8XX0FFB9G4oQCQ/VoCY2/kbShpthse2xFs5eZMCFT+
         4MzB1EXXJeXm4ycejWxKvue+6leJCHymCty8Fjgrxzq/LGGoCzm8BI+ccTo/nyYlkBjA
         YL9SMQb4WSl+H3yH8WU0lfloYOB5VH4/3wh4WDBWmQkygUc1E68g4yUrchYowWifYuz6
         MPzeHwq2YiN97iVeWzFsxEgiVOJbCbier+QbfKO8cLLvlgnJRgQ5dtXPkB237u1frLay
         YkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545018; x=1773149818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxfB3HBbmpVN4DFVHxhDpo7Z/qxkqIVvzrvJm+z8ZIg=;
        b=XOceeL1Y1Z0mT1BLO3hjZudltMrfRYjpZOrLVh8ZUCB95g4NCFRFpWo32ISnOHkONZ
         j7e/hm5qfiIuQC4m+I6iHV5K/ALTk6uhMjp47jqguSEobvifTzUy4HtI2M/o8Ftwa4p+
         LbWTHucKmp2uysyPC/lc/0dHj+BfVKZnyEjQ/7BM/JHRekAyM8gzmk7822qWlNa+Mx8I
         RWRAVwexju73mnider8AZ8+fDI40VYtOIFm0HwBPMKkh7xL7qouZAvEdPqvPZ4w2zrYM
         xvj/EE76zyXTntEbXeZFQIhF4IlN6TH1Y7egfb6klroOgbzDPzVL5zaPBVspJyZilbdk
         PjEg==
X-Gm-Message-State: AOJu0Yw631sQJEsCHlThGgzTVS4cfqw3FIjnIUrRjVDsISHp/lyiNKot
	cDaLr1UOAYBCp3GO7XqqOIEJcRQ6/8DZXKuR71zqJG4p+znyN8bkIQJqPbZ4+MrxPw4VVlPszrx
	CAS4TkznFEfXGEsIlDCISu6XFR3rwrjGgyO3+f5i66hBZ8id6wi52iMID2H7uXTw=
X-Gm-Gg: ATEYQzxMUKQONv6G3BleX4LVkzCvxNmgnnWl21PQwmwbuBdw31++9fQkzFt/3SOgxMq
	jqxEx6RyqqXMBOk+CQgVFGROceh6YaEMkN5SnrE3Bgte/11qMkQJvYD/kUEO6N1K1PmgjQzXXq3
	nGvmxm28odSIgYnzWV7/k3nheyEY5On7ocLbHAzjeNtSQPSi4G5Z5dM42GA6BKNrhssg1/SyuL4
	SugDBFcYB1OgQCCIBr2mXl0HhGzE1SGv678maR5e1V+k/IIwbiCqFirbliCji9MY0L8BzYmHWdF
	pMsaVRmA1SI3vJ4RDn06n4tVQFASOj/aBFG8UC/C9wVucQPy5M4Cbz72jEw+5K6Z6KQPsYCSBXh
	g7NFK1BebOa5IEahr+8X6Jvx3oM+uKTCQDvWGadiSl+qgNKzd7q5Ikuu8IPnzPOwbkY9YBw6Hoy
	lAx5YEmS9Uf4wULBVQ9720/xKUVsJoTNyPifk=
X-Received: by 2002:a05:620a:199c:b0:8c9:ea1c:f216 with SMTP id af79cd13be357-8cbc8d833e8mr2123649285a.14.1772545017988;
        Tue, 03 Mar 2026 05:36:57 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c9:ea1c:f216 with SMTP id af79cd13be357-8cbc8d833e8mr2123645085a.14.1772545017433;
        Tue, 03 Mar 2026 05:36:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123583e48sm566926e87.18.2026.03.03.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:36:56 -0800 (PST)
Date: Tue, 3 Mar 2026 15:36:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: add ADSP, CDSP firmware for sm8750 platform
Message-ID: <vyhighjmlrlekvkfutjjckuzjvd6vjxiall23j7dgzx2dkfhho@7fj66xtxdieo>
References: <616f5563-0b5e-45d2-9d6e-ec333c670d3a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <616f5563-0b5e-45d2-9d6e-ec333c670d3a@oss.qualcomm.com>
X-Proofpoint-GUID: pPkOba8NjGCWSfce2-FkoSP2Zq5g2QQe
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a6e3fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=da8fxQNjThx34T4lXPAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: pPkOba8NjGCWSfce2-FkoSP2Zq5g2QQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNyBTYWx0ZWRfX67MA25CSwh7o
 iQ0oTmbt7np4+l2hFda4JeWG44WBg0CJhWc0Iydc6czvKTfmniJVCNTq1GJ4cER3wdpzhTuRk3r
 I3zyIJgFDa8rTZNV6RlR/1CEf1yoCRBigWvtMkQt3J1bNplFpHubeIyOSMcDnT2nkfBrS2MHh1Y
 6Hdj89Z4KjLLJnU8L7dPsEn75yt1l90QzSAMhQPUkoGLNHNXKd1V0PWDj/O9NwvvVWrQq4XHzHu
 BVu5XsgJqL+J/bXTTe6PsmElgov8K3SY7X1DdK98hcQF2HVp6X0GuB4F8KbbO+C9a88in9aerzU
 p6aiVrWO7X2djkxGCsj3aeYH66sTTvlZhet3Z1uxg60s2pLD6X/o71pmURSjZAzeIiQGWBtWWao
 s8BV0ktch5ONGgLHANG1gURxD8vaUerHHZQV62q+QCHQBpIp2N+5wGzLOicI2yOqeOVAUFxvlmu
 7u0E/Ok3OTeIe8nDA/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030107

On Tue, Mar 03, 2026 at 04:35:24PM +0530, Saddam Patan wrote:
> The following changes since commit d8e138dd8970ffc9f5f879e2d62938abe6cd3f22:
> 
>   Merge branch 'bt-hsp' into 'main' (2026-02-26 14:52:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-sm8750_dsp
> 
> for you to fetch changes up to 59e01db298ddba41ff4aa7c94da332b3d868f8eb:
> 
>   qcom: add ADSP, CDSP firmware for sm8750  platform (2026-03-03 16:32:21
> +0530)

You can't add something which alrady exists.

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: add ADSP, CDSP firmware for sm8750  platform
> 
>  WHENCE                   |   4 ++--
>  qcom/sm8750/adsp.mbn     | Bin 19421576 -> 19413384 bytes
>  qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 180024 bytes
>  qcom/sm8750/cdsp.mbn     | Bin 3912104 -> 3920296 bytes
>  qcom/sm8750/cdsp_dtb.mbn | Bin 36664 -> 36664 bytes
>  5 files changed, 2 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry

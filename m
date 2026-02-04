Return-Path: <SRS0=9Qvs=AI=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBB1E83EF9
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Feb 2026 09:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09730C2BC86; Wed,  4 Feb 2026 09:19:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20EAEC19422
	for <linux-firmware@kernel.org>; Wed,  4 Feb 2026 09:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20EAEC19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6147Esrv360224
	for <linux-firmware@kernel.org>; Wed, 4 Feb 2026 09:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fVE74FP8sfCHo6u/cgRGheCo
	IGlDnmk+Uf+dCydJmWY=; b=XgNUxY8VNjScQUhEfa/6YO5ll3gQQNiFP2N8sKwe
	s4pHROuMg+GYNsqLl1uknjpR1qLWmzDjadZuWJLTQ4zCibEiOCeWJ5mrdqmM9ewq
	53lRr4Wk00s3bs+UYZioAg2OQvfzhYtlXxin6oKXnRS94xz1g0sPzD8qWYnndz9o
	W82ZvrJelkGJwtSwaXQB92rCqtCNvopp4htO7gIlWvnojnaaKxnrdRJqWgwl71nA
	OY95e6w/NEl81VPQ/qcp4fYKU6J3q060sgIqEhj3gjwNcOSq2hamKZcYgxxqyVgk
	i0dUsJEmrxz4/Cp6taFrL4LPrJ5CB3RnU/H5d0k6Ttilbg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ne7tptb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Feb 2026 09:19:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so613566185a.3
        for <linux-firmware@kernel.org>; Wed, 04 Feb 2026 01:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770196789; x=1770801589; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fVE74FP8sfCHo6u/cgRGheCoIGlDnmk+Uf+dCydJmWY=;
        b=iFG3AJkOspeeNVEtl6b7TUWi4yBDj0ixZ4kjSPTqlyg3UN+NATkcOQ2txPnz8IOfEy
         tuFl602RjwcR1zIGYJYUw4JEOfW692JZO2qOb784KaMOOete6Ix4GDsdUPrrNFwsmQu6
         6d4Ry3fSfExfBpW9MC4JwZaNCvJaM2rwacMwnouZjV0bzi8J+Rps3oxE5TsCZjlEjzn6
         2T9yIhHJDP/R/Juy8kKuwpB6UPY0E0+QYEzW6+RfTDRvmLTg9zhGGbHvBnMJzNSbLzoi
         7iSF/1HxnW3dHr2rJ1eB4dq2zOdD6CKvvvCNOcALF6Nq8ffcvA8o36y+f42AH9D0YsSx
         sbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770196789; x=1770801589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVE74FP8sfCHo6u/cgRGheCoIGlDnmk+Uf+dCydJmWY=;
        b=mptocZX8xFpCT2GT7+vF7dpFtDYcLAchSYcrQrBKI3UoMRrlnJvjaW7qrWWmzo1nxW
         M1UjI2shla4fjgBbBarnTsbRynO+eitVWFD0/EIV+qQfVCx5hL8JTm93i0BZpJMwyArJ
         /6fyi58fk0ObrgKelNknwpX/2xrG2he62pWelqaZtryCqHalHyyDue4tl6p1q/XE09T2
         DMTETVU7b44scrIup0njCwRMlnB4OPN7RriDqNpo+RT1sato6MM1zP/PMNw3vhbyJWXF
         SaEE5pZDW7vnwn5HwI8kIIbS4af5F4Ko9g4yf1mTyQvTmV5DaJtomRPcJtAbm8Dh1bYT
         5p0A==
X-Gm-Message-State: AOJu0YweHmYHG874X5jPdM8RTkZVzlRAqFLvzoKeGgk6WLJyP3pDgEnM
	oCh6xNeloyblY0vWyxlFCsvZ+76+jO/Tt6+4Tx4etxk4tYgkCy6x2mMMy464Q1/sD6pQN4VviT+
	wgh17gi1Xys4QVr5kJYUC2dAZzAdfOrxje/94rNv4Lxb5ZzOY1uAdy48BpMxxxb4=
X-Gm-Gg: AZuq6aLEWVeGa5q+kSOeQVonC49gCwekOciSF6JUWY7f95K3RixK4ltVmgf1nIt4orr
	k9BjVt1sIspa5Yt3foacTgKoo08bD51+ggG2hTXK/bVpL+QG65Hvm+lwQcd80kGWrvLRYTE9bB3
	o7DZ16y1+JMQUPa+aSTtZH+wmQB1MIglTp7VaQH9H8wlQR1V4pu0L1ISFyWrgR/4ZreS9q5G5P3
	WW5Dn+2lwP4e7mVD60JfnelbNGbgLVyVbpg+rIIYeZylWdKPocn8IMHxSE2gS1uP8Zt3TbTGrd5
	kXsowhrAzfYOgO2lOPJLTTR/2rVwfpe6DaNPtoNLG47K2p+Im2cYX+r8hEQlgVep2yuRGOMiIw5
	YkNYBX/Az/aujRZurilblpB5IlyaTm2oeSYBmVnvEUe18eHma/RbxIytZtAymSQ7XhWUxQhVigM
	L1VZj4RnUTTfu8N6WsOkWH6co=
X-Received: by 2002:a05:620a:404c:b0:8ca:1240:4991 with SMTP id af79cd13be357-8ca2f9cea9emr269540485a.45.1770196788876;
        Wed, 04 Feb 2026 01:19:48 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8ca:1240:4991 with SMTP id af79cd13be357-8ca2f9cea9emr269538685a.45.1770196788469;
        Wed, 04 Feb 2026 01:19:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff5a5sm515464e87.5.2026.02.04.01.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:19:47 -0800 (PST)
Date: Wed, 4 Feb 2026 11:19:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: add ADSP, CDSP firmware for glymur platform
Message-ID: <ehzt7a5fz5mlmwtqtmop67zxo6hdar654epchlwfmazrzdhv2i@auhupzfkrbha>
References: <f67a3934-a0ce-4dec-8694-d5a2146e7e58@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f67a3934-a0ce-4dec-8694-d5a2146e7e58@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uAOzFNCCjAJeivmPNopl01DZGfN2g9Sy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA2OSBTYWx0ZWRfX0MJO0U4JWAEx
 tGfEN8GajVdK/u8RPyQcU5Ekwcl0LL2N5H1/SE+krws8FFfJX75OUw6/fTiY+dgkrnzAIrRwV/f
 JRHmO4LkmWkDC1i35bceVAwS2dXRu4sZ/lIgExcFMMNyseedAS/V7a488O8cnkBcvENWwdhJOAk
 2A7OX7/ZUMbSYqDj3YtsupiErv586wHGp5yRVMYoT1Wxc/6drge3YLs2eKH88lb1AeeYZRuH08y
 Za/Lo9ZgUjU9xLVr3w52E+o8MzH4hFlaA4tmLt6ExeGQD3uLGEgHBSrsvo2cyi3TVPCvY8vm7DO
 xYSSOldWgHqwZZpClRiOyd34vwqS6F6JgqlW0g2945jTkCmYwJS7FPyaex75d7KfZOHeEOqxNFU
 RToBGQUdh49T9zyjCZ8nLKVJ4rXMX0OSerJ/X4SBh8zph+71km7hAIzOvimkOMKG8iDxnpCCmGb
 g1RQKWXuV2GGFJo4iig==
X-Authority-Analysis: v=2.4 cv=TZmbdBQh c=1 sm=1 tr=0 ts=69830f36 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=M1WKQp-MnW2IrPVK-hEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: uAOzFNCCjAJeivmPNopl01DZGfN2g9Sy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_01,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040069

On Wed, Feb 04, 2026 at 11:24:50AM +0530, Saddam Patan wrote:
> The following changes since commit ce97e4b1cb874c67a132441f9d69a55511a1ded5:
> 
>   Merge branch 'robot/patch-0-1770091836' into 'main' (2026-02-03 04:34:00
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-glymurdsp
> 
> for you to fetch changes up to b69afa29d3f60c1939a745879441acd43a2f0c73:
> 
>   qcom: add ADSP, CDSP firmware for glymur platform (2026-02-04 10:10:46
> +0530)

Merged and pushed out. https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/904

Please submit Hexagon DSP binaries to the hexagon-dsp-binaries repo.

-- 
With best wishes
Dmitry

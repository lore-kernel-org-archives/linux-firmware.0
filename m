Return-Path: <SRS0=NWYS=7K=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C0BCD0425
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jan 2026 23:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59B42C19422; Mon,  5 Jan 2026 23:39:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 808D0C116D0
	for <linux-firmware@kernel.org>; Mon,  5 Jan 2026 23:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 808D0C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605HeuiC3541659
	for <linux-firmware@kernel.org>; Mon, 5 Jan 2026 23:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+7ew8lIzdvl6OpwKvmyppKYIgW3vNMFbhMmkeVZTVE=; b=TVuwvNI9OYHtZ/6h
	2+op0qfpDNoEPQD+xPyDGeozE+EWq8d4O7qCpbQR9QHjx49AC77jlYE0bogA/Uaf
	H5EevACJeIFrNZRQTXXP58HrAkEl6qRD0TI+/G0kXgvQlk2UUQSEudbUql8wou0Z
	jG9HDiLPQuRiUtP9J9OZaRktc39wVY/CZLVCEVVbJUU6ieVo13oN7707Rb0l+VCq
	psacVxphieVSshFMhpglh2Ky8pxXEBMkTtJDCMxjxIv78oy8iJL3zxD+BXYjBVUb
	WLnuNIUIE8yHDf/rl9ZdyvHfQyk7sebmbFxkEbVL6tcHhsS7OJdRq6oK/9O/4ENc
	ZJ1Etw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57sk7m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 05 Jan 2026 23:39:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1dea13d34so9703811cf.1
        for <linux-firmware@kernel.org>; Mon, 05 Jan 2026 15:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767656380; x=1768261180; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E+7ew8lIzdvl6OpwKvmyppKYIgW3vNMFbhMmkeVZTVE=;
        b=GRUrkv7k5kT909+UI1Wdx9Tps49pqahfIzj1cvjYMSGvBTyVJIp9iM9G5E31PnewL/
         X67krp0N0RJ7/dHV8OL7+R41/hh86Id1Iu6WIbuD0n+ll0ks1gLyiq0HSBqxmiRNIvyM
         PcIgz4zKds+VuRXrFkZWiMtn4WfPoH44DIvlVmxrPhZVx0DqSEeHuZ2H0nvEB/1PLTAh
         s4desjr+FugSrEHAsgvXkxNjnqPGXV7ToPWJuA+2D9XdxMDNC4GzUjVFyJKHi7QRvRJO
         zhFKcz6fpDumKzMy+0t0YFDXMfmh5/48xZMNg/hp9+u5MMwFyBwc5j4EMfW5fEzatENW
         jXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767656380; x=1768261180;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+7ew8lIzdvl6OpwKvmyppKYIgW3vNMFbhMmkeVZTVE=;
        b=AkoIbHnkGE4CxiI/PCm0Xr+uEskNMy7Nax2qISkIt5abtNPOnAHAdnFpKdauih5GYC
         +EyfwqLkvnvW89BGa+N6C7FxFEaxQKBWDzMzrTtQ/QAoxRVjh8d27ZVE9GgaBYmJOoFc
         ZlQDCptDuCRmao2gIG17gFtb2IXcC6hqelMltmuTkF7gpMnBMl8acMRYUmd+9G+xv/Fa
         1lGwwCBY4j/b+GBSI2jF1boswqpUyjlBqOfBnQJQPwz+vccBkXDyaBGeKQ5cT/oBQTs2
         BhNMgb2xhH6nAk8e+AOJtJd2HjhM9eKZDbshk6PhE0s9Lsc6oyN4mTSy6VvQXeNqepjD
         09+g==
X-Gm-Message-State: AOJu0YwBCN8O1yyXemOLh2g4XSwpT/c5bZ5+nZCK8fgBIKwY1etXxbd4
	BBCod37wwESemxUJpUZM/HJNp8d8aqi/65Yg7ArU/lnXqwVNCNvOKKkFIrv+E4pnLC1qjOlz0za
	NT8cCGObprQld5hdTnz59qf1UXr6m8JJN+z/owvslZeqoJdK78smW9qZ4gEUeqJbHuyDxnMI=
X-Gm-Gg: AY/fxX6L3Du0J1wRsRWSBC0ysXBKz6sKlf5qPxnR5ijlo8FyP1djfzCTcpVV3NXAD58
	vj/lJncbHHF9IGtJzHQ5OY6ljNfMI1WrK1kBgwKcXvxwutL8ptlIgp78rhURfrdmS7KDVOTkOPe
	Olpo1v+HKpIcfUn/txXAmuspfI91cJI8K4DoLgdlnWApbO+YHcqvCI4XlbzO1uLPvkL5KhGuOWt
	CKX2dUOxT8ziARVXVdZVRtLp8lWYhcEvl762M243kzZBzz1u/1korNSQ6Nf27Vgxq3f2q0fTKFO
	zsN5WNHZEpkN1+/hAm9xmWMQl8z+Ld9yOQBzLU9w6+jcav0Dfy85OqGHEry8sBvUXU0Ayngv8vA
	SgAC8IH7J8a+y2aNDPu3YCnkCaI6pwmwqMZowu74ZGHK34guiAIBWIfbf0q4+jaGZCVpLqlF3GR
	UxbEFXSAh2mANVhixjU9k6G2w=
X-Received: by 2002:a05:622a:8e:b0:4ee:5fc:43d9 with SMTP id d75a77b69052e-4ffa769fcb7mr18129191cf.16.1767656380537;
        Mon, 05 Jan 2026 15:39:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhf+GilZUzWDKRHD1X721Kd1qo4KC+vEfpp7ADZLKkBs1PxW7so8mzQp4c3YVB8SzWCfgy2w==
X-Received: by 2002:a05:622a:8e:b0:4ee:5fc:43d9 with SMTP id d75a77b69052e-4ffa769fcb7mr18128921cf.16.1767656379986;
        Mon, 05 Jan 2026 15:39:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b66697eaesm42539e87.53.2026.01.05.15.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 15:39:39 -0800 (PST)
Date: Tue, 6 Jan 2026 01:39:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: firmware: Revert kernel_boot.elf due to license compliance issue
Message-ID: <iuvfs37h5sprpjj6tonrhphuuakwjqypkgmf2a7j63lyx5ff23@lorqwpgnj755>
References: <ee09eaa0-1005-422e-a552-7fb4caa6700a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee09eaa0-1005-422e-a552-7fb4caa6700a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695c4bbd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=IXyWHGcFjsToKacQHHgA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDIwNCBTYWx0ZWRfXxKkE36hNF9vZ
 1cYmcgt6j7h8vtg60HDN81vUtHl3zNQL0Vvw/7U92Cl7vq5xuBiB6RGSCxYniP2KLvMR1Fq6PWm
 du7w6ukji6cRT6fXUHeBsLJx2z6YLoUiGeLWU4KYthgR0COa8MIh0o8ERfX73JO11+c0y9dfr/L
 tUHDRjTqPe5zov7C5skMk3i81epB6ujy1pkskrTs4NVQATCIQBqIGfna0FCWgpxnjWZ6pQT2Tw/
 R3Dmh7EH/HN4+Kk8DkcDMcC6Op7w0+QGDiEM1ero8/4I/eYzssY4FkkWPuORS4RyPV1uk5qU/3X
 zcnTQQ8FxeTM24pfkS7okiuInPz5Ar/eDYYKQjxaSquT2qrlWBKY/zeHzTVd2Ldvgzh+9EU2QQU
 uag47V7ahw262ObM49KuqvbYP083X1WIgOzCMoR2S1I6fb2FcXRmi6rX/rGUKMc9NNxndtWUJcc
 8tENhApXck84ndWDK1A==
X-Proofpoint-ORIG-GUID: FoCzVHK3HpePkqHACU00WVh1vs_tyqhd
X-Proofpoint-GUID: FoCzVHK3HpePkqHACU00WVh1vs_tyqhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050204

On Fri, Jan 02, 2026 at 01:06:41PM +0530, Kishore Batta wrote:
> The following changes since commit 154800e885413bdf90b80b94e2e12f441be79fde:
> 
>   Merge branch 'intel/dmc/xe3lpd_3002/2.28' into 'main' (2025-12-28 14:09:48
> +0000)
> 
> are available in the Git repository at:
> 
> https://github.com/kishorebatta-ossqcom/remove_kernel_image_qdu100.git
> 
> for you to fetch changes up to d018ee81d5c0a7974660d5d07fa3c515593afade:
> 
>   firmware: Revert kernel_boot.elf due to license compliance issue
> (2026-01-02 12:50:18 +0530)
> 
> ----------------------------------------------------------------
> Kishore Batta (1):
>       firmware: Revert kernel_boot.elf due to license compliance issue
> 

After a brief offline discussion with Josh, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/843

-- 
With best wishes
Dmitry

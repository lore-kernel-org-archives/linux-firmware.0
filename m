Return-Path: <SRS0=MiJQ=W2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19164C36010
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 11:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2321C4CEE7; Tue,  8 Apr 2025 11:43:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E550BC4CEE5
	for <linux-firmware@kernel.org>; Tue,  8 Apr 2025 11:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E550BC4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BYcmJ020148
	for <linux-firmware@kernel.org>; Tue, 8 Apr 2025 11:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3gBFI2eVOJdyw1x2SpZdBhms
	idXiHtSivpk8i8ML64k=; b=iw6Hebx5Slr3eG326F8TTflWjwssdnE6lToXYdYf
	nBM95XK4rRKo8GROIUCaoOIdcC+VVINs/0hGxv7FELgvkiw16Ry4tPslkCBHcukc
	gxg0Hwm/PfJR3ln27rlg9RkcGQEDx0K/V7NxxVhQ8fEVMt5Qa+bCUT1bbkmxkvd6
	v1/dQiB+mR7RHmfqxSaFwptEqUewX69/rolG3Iy9n3XMu+LG3ObJPZJwdzuIMIce
	lJelXUuEGR+P+idAu5ugwviCbJOZHUiKd9O+mFDUJceW8hln4hhOEaiweIFaSnkm
	OF9ycUVmfnM2ot4lLHA4qJPf1JTN2cG4Mz7s2ZJA1ln4aA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2qkxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 11:43:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ed78717eso99622216d6.2
        for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 04:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112600; x=1744717400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gBFI2eVOJdyw1x2SpZdBhmsidXiHtSivpk8i8ML64k=;
        b=ZOuOVWlQW7XwTPk1Iv414EZTTaaacCZE6UZZj0VP+LmVSt/glPY0pzlJ/F4fjGST6j
         20Fm53bGF6yTsha3IJIVqRQPswtHW3g8kh//rRyWUYTpXZPtvCExK4rlmLb09UcD9Gp7
         j2iqxd+H4Tln0+pcNHbkX1epvHmsTR+Fsydir4HNPMljnueU6kqmS1TjV0MdTlwpc6wq
         N+tL10Hbil3dQM+fLxkVQfSichsrA/EyffkNT69wPcsZus6eSpgitg93qv5xxS/2nmMu
         wNTPjdlyj9QMDd+JfwcqJsMVkVGTBbHCUtJZ62jTHCIJhr1M6jY6BV0+VuTlolFtEgEY
         sOMA==
X-Forwarded-Encrypted: i=1; AJvYcCWkm21vQZ1EJcgOuD9dasEXRysIqPAvNEnGmisTwTa6H6At72mJgLpRrX2qsdw3YRy33vxj5wGeKrAzZIDokQ==@kernel.org
X-Gm-Message-State: AOJu0YwqsREEYlDRK8KlYlkZdaZLqE3eQFEZHIf+uYod/fc0J8x3fcG3
	IaPM2yBGnJhkDsRjawwnlgXoLMS4jBZmq1B9+J8T9/Ftl2rjdJsxhCYfJHFOuftubSw3QmBBlyk
	7H1Mfl3FY5gJlKXBuRu9foPQ4LeTgYVfiIuuB/uhgOXFI4BbgHBf7rg4hhJQ=
X-Gm-Gg: ASbGncsdTHVUv5iKUsN+piPnoA/NU7mnJurrUmNNicUOmpA1GNKDzSvotcmYAdoZfMM
	U5HLuPebjfI4c/QzmgOfqVQGB1oOLzowHZbUy53+rtS8ZQME5u1lXqhk8CvnAXhM/1AQ64fZCwO
	WwRvcNPh5XkH5a9TQLOAuPCqbgHt+6ikw0+IuIEqxQsb95R7EmOqBvRknceHQqwiSWB6UbU96zE
	DN9WcF//p9IGM9FQkg+T1LX2MzDQNybByJ1zeBaBF1rQxnDttcTX4a7WKVNpPmlawCLAC9+Xten
	7XZD7uzWbjeA4zsvLLC1CGYzTjoKncq1a7a3JZmkTZ5LgdNlEEhAtTFug89yUboKNx7GhyyQgeC
	wp4U=
X-Received: by 2002:ad4:5d47:0:b0:6e8:f166:b1a0 with SMTP id 6a1803df08f44-6f01e78f95amr342355546d6.36.1744112600416;
        Tue, 08 Apr 2025 04:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG13gXzsoq2qQadcecDsoP0TFEOXyvd8/ypMCwXYbRO4mYf8jcHllAHa4VDAS6bf/mrQJyfCA==
X-Received: by 2002:ad4:5d47:0:b0:6e8:f166:b1a0 with SMTP id 6a1803df08f44-6f01e78f95amr342355206d6.36.1744112600115;
        Tue, 08 Apr 2025 04:43:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0312a2b5sm19133351fa.8.2025.04.08.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:43:19 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:43:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Josh Boyer <jwboyer@kernel.org>, Zijun Hu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, linux-firmware@kernel.org, agurenko@protonmail.com
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN785x
 with USB interface
Message-ID: <r5wix6wmi5mw43cyzwb3j36az66nih2bwurkikgwgw33kltg3p@b7hyrp3kqyg4>
References: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com>
X-Proofpoint-ORIG-GUID: hjAl67_vONAbx61wP8OjDNoTXxBjpu9N
X-Proofpoint-GUID: hjAl67_vONAbx61wP8OjDNoTXxBjpu9N
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f50bd9 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=qnCiB9-Q6lRKnzBEusUA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080083

On Thu, Apr 03, 2025 at 05:41:11PM +0800, Zijun Hu wrote:
> Hi linux-firmware maintainers
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:
> 
>   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)
> 
> are available in the git repository at:
> 
>   https://github.com/zijun-hu/qca_btfw hmt_usb_x86_0403
> 
> for you to fetch changes up to b12240420adec3089fa0bb5a09eaa0cefbd8ce76:
> 
>   QCA: Add 8 bluetooth nvm files for WCN785x btusb (2025-04-03 17:18:24
> +0800)


Josh, it seems this pull request got ingored / skipped by the robot.
Could you please take a look?

> 
> ----------------------------------------------------------------
> Zijun Hu (2):
>       QCA: Update WCN785x btusb firmware to 2.0.0-00790-3
>       QCA: Add 8 bluetooth nvm files for WCN785x btusb
> 

-- 
With best wishes
Dmitry

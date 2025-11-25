Return-Path: <SRS0=JnPY=6B=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C82ACFD37A
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Nov 2025 09:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57F14C16AAE; Tue, 25 Nov 2025 09:49:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 675D9C4CEF1
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 09:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 675D9C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gif31688183
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 09:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AsejpbZW2/yfnFN19Lw/Hb6Y
	E7Jvi0wl/48HRTXSrJk=; b=R2e29LSHUCal/8WwNM3zsRNtCRciYcaHZajoo/KS
	wd6YqHaTutlYy3pwvfFdG2QJs/P9ufbzbH8S0Oj1QV7BNx4v99/4oJvqVEwSUfCL
	O5VzRQcWILqYzJEVZhmg8zgQmXKWszKV3CusIFZhy3vzpxU8COFE0CnScz/NO98X
	R7crPlqdvHVqz0V4+ifaCmyHmAUg8BIhOwJEG3AA13yM75Z/TElG9Vxz9PWhZLxB
	sg0Ay4mAsRRrD0BCKll5qjNtReXYCK+qfkBOthNjrCjiSmXtJYcyHDtFOdtq7muG
	KqlFyc+hS25U59lNR9uxZCLamfa6BPwc6XAV0+Emkbr7gA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amrv6b5um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 09:49:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so1481996985a.3
        for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 01:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764064190; x=1764668990; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AsejpbZW2/yfnFN19Lw/Hb6YE7Jvi0wl/48HRTXSrJk=;
        b=SgY8BLWo6NODV5EjOrRGRBXoMp36BgwC0jOkIuvwgP4E6clbjeWNFj75+e0MCKsw5Y
         r0HVi2RZ4l4FEuTJR/jYqlgjwz4TG4DRtAQCSaIxmRx574YVwv65DJ8NSBahVmPpv74m
         0gvd51gsIJcAxFvLCpNLbKP6qmgix/Kag92I/Jsj4CRkwx1RYlwSD6DzPkIEcB5uuaCH
         KnKjrFTAutrRd8pp8JQBfKJUTYXa9IEDirtBW2f5b5eG02GYWxFaAhJRyyBHlm9O7EKp
         /Efm07YRyk60BGp5w73PX7+ppRNl8EGmW38rEnaIOFl7iZpOi6azgrBg3yodrS3zV0nI
         Pg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064190; x=1764668990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsejpbZW2/yfnFN19Lw/Hb6YE7Jvi0wl/48HRTXSrJk=;
        b=RDmHpDpIzUNUoTy9TiJHXwmkS2gPTRd8jvBXXNzFcyAjiI1i8KDVvwpEJJ1GxeAv7/
         q107WEFnfg5vI/dxC5CZJUYMskgkljtoRjUKao5j65wiQqYi+fD4CPS11B4OX/dXeM91
         JtPGJG3Of+d6VFgG3wDIqFJoKo3ZDTVVBnh8YjkDhp9sMursVUQI0AzlbFOEywxrLBag
         5NF4Wu7iRhpzi4odERC6nh66+xNuZSKOyooNhkRkFvOiXVpahMQvLHePYITPpxyO62QA
         HW7w7mBr2UWEnhVLKETp7wot82RlJYVWoXPjxeNl0bGJ40FWazkGTQWnJzIFJS68kTlN
         3uDA==
X-Gm-Message-State: AOJu0YxhMFTxZvLfSDRxmyQTvJnA91uXaKbheN9qmuevpgQqEuvva9wS
	TSxQy0LaFDekihsKN3hnczPZ4bN3lZ0hXfvoNUfKtipAtTphT90Bd/6DX0ejCYR6powkXOvpipH
	aUEo9C76Q0A1e6tq3qdjhn8gpig2lJRFjO2sXHQqp/bpVWuN4O2HT9TlUL14xfro=
X-Gm-Gg: ASbGncvH5rE0n29luAneZlGj+x8W9htnhjOJoVGNxbQXW5JxxFl5trg1fqpAueWm389
	wgSrAT6SQ7moQJL0UlP6+I+zAxsMOM12NOFsl5oZFB0eNjSCtr+tzzFm3VFej3qMs/ThrIfobm5
	woWEGNwN3c7cE8qOD8yx5rUdOIxkjyHrDbKK8M9rKPa0fKu++OcpcXhCESJe3eWo3j1EZC4u0QL
	rtjEXrrgVkYyH5oSMpt/jhQp8Iq6s60O3RRkMbch2sHsSL7GZqqoKXTTXywuJvczk2ivuDYffZu
	LDIobJ1fZpvSUNdodDTEaw3Icnv415HxNjEKFsYgDP5uBc0QxEeFv8PMaLx2vv5bQwfM7GyJmI3
	RyNzQilsF1+VYKgxpdJlFGhDniKHrOy9ujIWWUgfGjzXyUY4H35K1IGFOTtkkMifYkxf675sIiI
	y5+IhPC37lL7SJ0Pp4M2emYlI=
X-Received: by 2002:a05:620a:294a:b0:8b2:5cdd:6a16 with SMTP id af79cd13be357-8b33d4823efmr1913637985a.82.1764064190417;
        Tue, 25 Nov 2025 01:49:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYOfRBijjjx97MRlR2K2MTRxpOJHiVuNYEWl/cTdB0fMaDlSdrfWAhcEI0auj2hmDOfCqi4Q==
X-Received: by 2002:a05:620a:294a:b0:8b2:5cdd:6a16 with SMTP id af79cd13be357-8b33d4823efmr1913636485a.82.1764064189984;
        Tue, 25 Nov 2025 01:49:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc597bsm5040011e87.69.2025.11.25.01.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:49:49 -0800 (PST)
Date: Tue, 25 Nov 2025 11:49:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmware for WCN685x uart interface
Message-ID: <mnhlpuus5ply2r3wwbv2qyaqz3mpdawrky4ee6bs4ciaefnz6x@7c3wfjotzvxx>
References: <897a0b73-8903-42f3-805f-1c568c93feb5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <897a0b73-8903-42f3-805f-1c568c93feb5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA3OSBTYWx0ZWRfX4o2+PYhC2QwR
 uXL/iETdiYeEq63yaXODs8go+wj4QJSQEbsq5GOJdUsWpiS5jJpWfWYnLQEAs4DbUOPkcaobgyP
 14iV9EGEt456wG1seFpCFIYjxYV1MMnoViO3vuypu4BF9OcUXXiz+9UYp2ZDEfArpPpDZ9LA++l
 DnyxuccIeZyoL1SvB4b3omWF5Ihc+QrpCEj2YlSDBvpZODX+lxirim/POjwiC1B/S2olFk7SuZT
 rPf+YhML1SMPaEBpCIzmEYr876XiGgO1MrM9HR8LVsLdmpcMDRCccQsGNztBEXUgReSSlPPpS8k
 Q9rcTRmeOEsscPeU8RmFhcebta2g/Osp9Bd6LnbhCGOJwqLGL7iNNSP5RKZe612l6bzbGvisuBn
 m1JRXihpKfTt5TwAXMbHlHv/IVSqeg==
X-Proofpoint-GUID: 2IXNW_lECebON4duLutmsUelGk9uHgkU
X-Authority-Analysis: v=2.4 cv=f7BFxeyM c=1 sm=1 tr=0 ts=69257bbf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=FjCnVCZD3c6yof3nJ1kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2IXNW_lECebON4duLutmsUelGk9uHgkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250079

On Tue, Nov 25, 2025 at 02:07:49PM +0800, Wei Deng wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit ff6418d185528bb9b040de1066c34fa405ecd4bd:
> 
>   Merge branch 'amd-staging' into 'main' (2025-11-21 20:17:56 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/WeiDeng-weiden/qca_btfw.git main
> 
> for you to fetch changes up to 6d5c3fc550a66ec5b778fbc633ab1720a3acbd6b:
> 
>   QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-25 11:06:48 +0530)
> 
> ----------------------------------------------------------------
> Wei Deng (1):
>       QCA: Add Bluetooth firmware for WCN685x uart interface

This wasn't tested on your side:

E: qca/wcnhpbtfw21.tlv not listed in WHENCE
etc.


>  qca/wcnhpbtfw21.tlv | Bin 0 -> 152784 bytes

-- 
With best wishes
Dmitry

Return-Path: <SRS0=8HId=6L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A55D339A0
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Dec 2025 17:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E718C116D0; Fri,  5 Dec 2025 17:54:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 410D3C4CEF1
	for <linux-firmware@kernel.org>; Fri,  5 Dec 2025 17:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 410D3C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5HrTAn866921
	for <linux-firmware@kernel.org>; Fri, 5 Dec 2025 17:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fbxICOB9Bc/ezlZPQU2xTrv5S1wzWcyjh3rHWTe6sAM=; b=b1hrIdnafIcHwo3/
	aYJc1bmt3ArcNdEF7bxu0A97PTZpx3uSXN2GpdWg7Fo9jwjeZHL16M2/PAxBZgT4
	0OpHpuuXdB4mRGX7Cgm9V05qnYu4PVSjRM6Q8VnRniU0VjlNm9N/qhlrNazzq+71
	pVtC4+ylknrfT2Se3LmcQxDTPRELakxm3CAQhS/S69omrCQUrcHD9gfdoWUb3qAB
	trGiHndiXU8jURwqnR9U705vnvyPTM9DXBsLPrzNxPEsfFfszPk9ahmJM05bnYdE
	dnKtw/2dXkaZBvaT0FuBgCysIbqpYkraMfgG8JbnJuVfhiOiS8PO9UHmP0srMXFy
	ILyZ7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av46f802k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Dec 2025 17:54:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so714454485a.2
        for <linux-firmware@kernel.org>; Fri, 05 Dec 2025 09:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764957241; x=1765562041; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fbxICOB9Bc/ezlZPQU2xTrv5S1wzWcyjh3rHWTe6sAM=;
        b=TrqlIi62p+PSGI5BVifHmqRbHaR+ipj891/TaD277ADYvf5GZQsUzi3ARWsIeaFe7F
         clVismjAKXSIpMLykawWsA4EsuaVm0LCdstsl8dHcbwsIRuBtTaZCCm6JipT70EM/hD4
         3PqVDDafJAwALUcGGJyr5VxLojfRPAXkCz4tmBVxjVn1BoY6G7E+5dnx9+HNPtsoBXr2
         V2JesZew1KDzodHOnhR5E/pWoqJdMp1p7ffKzk+1FxzgJNgkS1+CXaMoSb7mAZV+Ak/x
         n/NsG5i4tMEgCycMjPasDdUQ3YrOu/7IL0aM2d07WA+coXMgd2xd6rMlIP8O59lfD5s7
         2rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764957241; x=1765562041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbxICOB9Bc/ezlZPQU2xTrv5S1wzWcyjh3rHWTe6sAM=;
        b=tjmQHLR1MA0SiSi3+SCZn+++CherwQk+huj/a913o0lm5ZFe4T+qD85P6kHNC/A7D8
         nH3+YHSrOLlrooTRWxs2hHfmoD9SwYxrAzIEW6LW9g4Cni2f/pYkHX9BpGhobk7WMLPP
         QZFId5urT492G1miw8s0qK2/nuCXXaLNuVcP7TOP5tA0sW3br9UPF7p6RO/0Ja93NP1X
         D6I6OwNe+7kVZi13C+mj4K9+wEQnvPurgc48HIVme1A4uNOlXPYzjxva69VmdNNGh0TE
         fCWkAM/D7dYRY4BO1igaztS1ZRK5XgyNF62TV0qyfcGoc5lGFO56C3YFbtQxgTKD5qZD
         pe8A==
X-Gm-Message-State: AOJu0YzkfPo/Ia9g78eOYy4490NVwRf09d18DwSc5ffe4Xpgq+0cYvN+
	TmLIIJ7ikEDgr68GTUkO2/IrtxH2NIt3YbX6tgCly+ipNnMYlqRqFK9Kp0LGNd38KxO0sHIG3o7
	+K8q4AQcRrgKNpgi8IsnT0By2ZlgGFEpMNLhFTlXSRtHj8+R+1maecdw30wf1SdI=
X-Gm-Gg: ASbGncuNelUemHoZ7MjB4nC6wWBG7f46QvHytHfNuBl/ulCVuiw8OUjE+1V5/Cdy4QN
	vX0tniJimmfv4fYLL2tkeFr5aaMelR9VoFqusHwGqX/GT4lwKAcroP0lo8FrBZA3j/VXY2QNe1R
	P709HQ/oIaKNgqdCuURcdt2o3aUS2glSOTvx939X2ksUs4avjrSeMuNGiws+u/RcWV0jZK0Jz4b
	RmVagCuOvtLcBk0vW6f+rkzIfhUlZHvuHhPjRGtCwRjbIjfCqsWE8NEsQZ/Aq6Ma6mg1+8XDkkQ
	2pmBxutj7TQ2hrrZ+rR1oEFKSiG0639o2bk/47Ya6buchHl3d3E/dECmIXZVvHYDInMyS7pqKmk
	ikOc05WmQGK/rX+31+sf3WWV1LFzxzI41eZZ5yetu+idd0hJ7ae74IoFNy6viqZDqKhb9WAT8p1
	jkWU54P9BVvcBFs16JLmEPJhY=
X-Received: by 2002:a05:620a:3189:b0:8b2:eefb:c899 with SMTP id af79cd13be357-8b5e68a302fmr1425015085a.71.1764957241293;
        Fri, 05 Dec 2025 09:54:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESywFrduc2Hduan766Sc1M3X7SvQz0F1tA8fOkMWEH4uS/Q1IGECZt3s3+gCoERUqYnGkwkA==
X-Received: by 2002:a05:620a:3189:b0:8b2:eefb:c899 with SMTP id af79cd13be357-8b5e68a302fmr1425010485a.71.1764957240777;
        Fri, 05 Dec 2025 09:54:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6fea583esm16409601fa.14.2025.12.05.09.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:53:59 -0800 (PST)
Date: Fri, 5 Dec 2025 19:53:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v1 linux-firmware] Add Firmware for HP Turbine Laptops
Message-ID: <gzlqws2m5vohtm5xfysrb6unyaidgc2ewizpzs2xbdb3la3qfg@aofucaannt7z>
References: <0c43af68-4665-436b-9bb3-1a55a0c09d4a@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c43af68-4665-436b-9bb3-1a55a0c09d4a@opensource.cirrus.com>
X-Authority-Analysis: v=2.4 cv=Wvom8Nfv c=1 sm=1 tr=0 ts=69331c3a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=mNM2UKtvJkP8x3B-FgwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: MK0W6RYt1A30pwVVEk8RYnxXIxh866hI
X-Proofpoint-GUID: MK0W6RYt1A30pwVVEk8RYnxXIxh866hI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEzMiBTYWx0ZWRfX7izn6dY91zJc
 wzJfZ4vEnAX4U94HFb4U0CwydPPMxD1PpHoWNtADrGMSnPa9nYvFhqOPZwMTNnQZ1XcQgg/Tkuw
 T0tbpe8RnriDFEbLD26HaZv+0hQtGEsqX8PEJFMj2vcxeNrc2gAbrI8FgkVCeR6vUdKpAZ00aQT
 eQllctKafpVQU5cn/cmKM2gPMQbNoj9h2Vnut1KKHRnJQafs4V0z1ffOHq9PbrnZcMCmcsChbM7
 t5Bdywyvi1I0Q8CN5//qQFkbFBbodY9bHts0KSSkvS0HdO6pW9tt1R+OCZOzsiQK3R/eHB9hACv
 tDnXzaGhZoL4eKIG7dBUKvubpH6DahYBUTdLmgHuuTqQOnVs6qsXWMSBmnTvxyYEK7NA3Hn5DOZ
 uK0Gu1zN2ZfqCwDRvfOsi4mRe0ZStg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050132

On Fri, Dec 05, 2025 at 03:10:47PM +0000, Stefan Binding wrote:
> We would like to update firmware files for Cirrus Logic Smart Amp CS35L41 for HP Turbine Laptops.
> 
> Thanks,
> 
> Stefan Binding
> 
> The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:
> 
>   Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20251205
> 
> for you to fetch changes up to 1774b2a25c75937d3c885adacb98eb6c6b99d8bd:
> 
>   cirrus: cs35l41: Add support for new HP laptops (2025-12-05 15:08:45 +0000)
> 

Merged and pushed out, thanks: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/818

-- 
With best wishes
Dmitry

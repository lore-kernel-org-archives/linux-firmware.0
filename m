Return-Path: <SRS0=CahZ=HY=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567F9CA5FDD
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Oct 2026 12:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 304021F00893; Fri,  2 Oct 2026 12:52:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790945549;
	b=3a8Vv43wQ/nu+fy5mOplyZk3m4XEkeQJPMmSLfPsBEjpflfwNsQbCbfxclrppRpzbEFs
	 rM8S2zkE7+9Uxc0OKHeypAz7WeqJpHbFLqAUKJHGR4Os6k9cnvo+sSbubzR7lpGUuR+dZ
	 Jh/IUm8DBonS596lAzRM95ZwMsoar4nrUAGISfaEhXepUcP+z08UhQp4KTS9nxcIBm7Yv
	 SUF/sTwkuBJy+SU9bal1GgEyJTm7SqlwBF/c9oDhhSbHIlNzU/BkRDok2NxcQFD0PfmXn
	 O7YIDeAIRcOj0KcLKhSYaDCkkxVGM7zLGMQ+0u76GLUcZJ8n3D9TFejXlUK9f5WIHzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790945549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fDvBdHA4mPM/ki4owZI02Iy9F6DsiKzeYN/4+z6dGp8=;
	b=yah8cfokWMEcwIOnnGbyZeIPtbtRAYL7OV/b2T4T32uVw8LfiWS7cUketSbidSHVn6vq
	 oIF6I+URLgeGQEMZ57pngXqCMHpCt+ZXAObGGDFWUZayr6d6YvdxSw+hIovWF6kUh4Udu
	 FQtZ/CF2NLMk8r3I/QijbYvOvNERSFyRPv/CVObAMZDFfJwCiVEThW9twKpQeBFaaQNa3
	 HaC3B5zBXi7SaxyXiNF7ItBXk6WHC4QNahF1F1vuwq2H74s+F6qJEZamI4UHrttblFkbH
	 IiN/ZHY3BiEFRu/iE1HODejdBFiT7sxfdnGZeAMttLewesJyaOdBTg0/epHfpOHwpmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ScnC/wGa";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H6Rr43RS;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83ABF1F000FF
	for <linux-firmware@kernel.org>; Fri,  2 Oct 2026 12:52:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScnC/wGa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H6Rr43RS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 83ABF1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929naUK3935139
	for <linux-firmware@kernel.org>; Fri, 2 Oct 2026 12:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fDvBdHA4mPM/ki4owZI02Iy9
	F6DsiKzeYN/4+z6dGp8=; b=ScnC/wGaH8EUMsyxfLuve/+x2xRKtrpbpWsPFujQ
	KzcUMj6ZvBz0bYVwppVDaAAXFeX7FZf1F4D8iCCXCuQzEUjX92n5cnQyj9KevBsA
	X/v+qdhUfrcpGOJJ6G/L+5ldmTyverSRq+L7YIcHpIM6EhL9OqG+g5GHgAKJXZP0
	xQV3t2Ig/oQ8c7MhDLLHyCh2RhxeFoi8p/dKav5mDqIQn4mx99lQz9ezUyJy/bwp
	yt14AAMxn15Htqs4/v2qo08fXUcGgvhLvYciFoFKU3XVAUvXSwsyt4lVRlGlyGud
	Kf4HVMVLTYp/AglUBm4Bsed9Wl3VKwmWrfzwuC5+BKiThw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxeb2vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 02 Oct 2026 12:52:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf4c0af4eso388966685a.1
        for <linux-firmware@kernel.org>; Fri, 02 Oct 2026 05:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790945546; x=1791550346; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fDvBdHA4mPM/ki4owZI02Iy9F6DsiKzeYN/4+z6dGp8=;
        b=H6Rr43RS4zvO3vu3NoDoFWakwwN3ksEOvjnTx4cdm9K5krxDlvCKxU336h0VijbM4K
         f2Fie3wQaZMCJk7Rvlth/zXB8hEp7rOVlGuJ5oT9WGxeBnCgamK98PKhirZCJwpzDw/T
         E7EFUO5FVIEXqSDk50uijLduWtd8NIDZ9YHvHs/aXSF6LdqXmgclmaVrtQ2EMx75VTTt
         +Udft+1+vmLTlFJMXm9TqelYRCGryQdcpuR1hJr5H76x3YXYwNxRgIKbfQtkHBIatOTG
         /Lar/oskByA6gZ+ckJ4Z9k8k78bh7tin71UahNilReDaQrPPT/TSQGnSSJA9o9TljpIt
         NWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945546; x=1791550346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDvBdHA4mPM/ki4owZI02Iy9F6DsiKzeYN/4+z6dGp8=;
        b=SuHy1ttZ9vh+x8W/GS2YyF6i0IMxoNjBWtwU7VV2S3dUu1PY2UsDxdaYta7Lm7wNQt
         n2h0UnermKEU9ByytgJlzp6UdbaAOuZlnTpOlYJva5FNLfT8kY31e5sYkaHSXLHjMy8H
         Lv5rR3a5QkqKESNzobbaFCVYdOv7bTzsNGtORnBktVKP50QL745C5PuRze5Mn2tjaE2V
         5jvllSO8VHkYlBsB4mDhKfPLWMnV41IO57NecQQNfkxTw6IAw+rEHxIHsWK6LHYOdYwF
         jI1fLZulZtrMzcxGBxdSlfbK9AdQkJq64v7ZPmNXlEtRpYVKUI0+sn/aI9TOIuourjNd
         1djA==
X-Gm-Message-State: AFuF++nWgz2EFJvtpl0QqvUs1BqZOlgxam+RdzBG2gFC/Sqkud4tttJs
	fpC9OspUa1irNRtRYj6Xn68HmeJ89b0tEwiBK40FukFUjrLg7OvWVESAjMfKC+OoUFbvAxzMukW
	83if4G3q+PkMQ0wVDISXpD7xHfJWaUSb8KIFLAARUJW1X/RsaBw7Fsmt4ctfYjFE=
X-Gm-Gg: AYBFou3P+Ubi8TF+iUkA5Cp94Z/NLwPV7ONtqnqQuWndWMkfIsor+sV8Ed4m9d4qF4i
	WTpLPGrE0SN9m4OthevygisbSNhRLTqACyH3kAHMb4fxkfC2wj7CIjkdGj27hcvQaRAW5n2RB0w
	yTRUQs/jOqzy9dXvTTlcbIJibw6xMIO8JF48RHF5SXniu2qQQMvoj+XbZT3Zwx+c/1HdgUc8MZ/
	/qmCkCEAdn5Y/mWey9PRKuLSWkY2gL/onIhYVYqZdIS8ri7ChMgrkmbujMRDmHa+qa6rbPTDpD2
	nXd2UrFYGaJ87TU5R4sY7SVDlPzV5/Ztp5pkKej+GB3AB0GPFYEMiG5YA6oocT1jGotIi2+zL/9
	IkOnFyncNSiVvSc/0heOtYe7kw2JRoPZj/0clf3iuhcEcXhzJsjqgkQew+MDlshqtdtsxuXIfDE
	1gy6Od3g1/vAYf
X-Received: by 2002:a05:620a:bc8:b0:93c:290e:9e9c with SMTP id af79cd13be357-93cb5a5d8ddmr1167371585a.16.1790945546432;
        Fri, 02 Oct 2026 05:52:26 -0700 (PDT)
X-Received: by 2002:a05:620a:bc8:b0:93c:290e:9e9c with SMTP id af79cd13be357-93cb5a5d8ddmr1167365785a.16.1790945545774;
        Fri, 02 Oct 2026 05:52:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7ac57asm695677e87.67.2026.10.02.05.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:52:23 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:52:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update ADSP firmware for x1e80100 platform
Message-ID: <7bfsa3ead7wldhhhiftp4sgm2mpnwzbq7e24vodwbansfid4te@ax3yobqeldvb>
References: <131468ab-ba9e-467b-a5b7-c645320965fe@oss.qualcomm.com>
 <bpwercpslsyla3njf7wdhg6maqvshmswpt4dbcozhmwd4lxvjw@yarcocckyqdi>
 <4ebb1053-1272-4338-821d-9238d7a96d17@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ebb1053-1272-4338-821d-9238d7a96d17@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfa90b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=DJNqvuoztHm_uY1nf5gA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: GVyd12HVNFU91BNPr-mhJVAFrS3sqfei
X-Proofpoint-ORIG-GUID: GVyd12HVNFU91BNPr-mhJVAFrS3sqfei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX0LfZSMaGdx2W
 VvOCeUGJB/UkkA1lcvBVc6dVma5yhv7jukJSdKXN3J7G+4yR2183RcZR4NYdx0qy3HH59ZJEEjr
 DJsOorISEr9EaB2nH+yDDDPsN3TOZlKpcpHixPPu3sVaHEEz6V+WbJzV2UKL+F1b6UyY9tqwH+0
 9hs18SNO/A2ZvQmX+QzEZo+HWfUGbue3ix9cm0bObrGk3Pcj9Wt25VqLHkg5rMEYaVmgMI1mK+7
 4BcBhiaemG/KaKlDAYLHY/au4bceb5NTBf+uSzvr7s/O7aic3t4ghOUFoKev3JTt8f4MRauBMuj
 m4NH0ELjqJo/qR0i/CHfuY08EWYhUp024QLrCOr0veLmYGRta1ID0n1x1WIL9hFPXJxpUGWrSPF
 Re3wXzJx7V2kr4fCoJrk8beU+PqStr3IjEgI+NCR6fgTRwM+/l7hCH8qp4NUwO3vY1iwVGUsyGA
 pN8yuARXatpGSeW/jDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX6GlRN3fmbjIl
 +06tk9Y/ftSusRenepnLsuwAeQhnYGgjfWowLcW+C4R+15ydGl6byIO2uM0jb3/RpThrYC/8uwh
 2vPIVmOdduHvMAwd4I10BlR+BpEdZyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

On Tue, Sep 29, 2026 at 01:51:53PM +0530, Saddam Patan wrote:
> 
> 
> On 9/29/2026 1:45 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 29, 2026 at 11:13:41AM +0530, Saddam Patan wrote:
> > > The following changes since commit 58a9869598b606fc2e5531298932b8757292f9a0:
> > > 
> > >    Merge branch 'robot/pr-0-1790653747' into 'main' (2026-09-29 04:30:30
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-hamoaradsprtm
> > > 
> > > for you to fetch changes up to 4a4a017e7cace118dbc110007a44778f3d12f080:
> > > 
> > >    qcom: update ADSP firmware for x1e80100 platform (2026-09-29 11:07:25
> > > +0530)
> > 
> > Why did it get the .c7 suffix in the version? What does it mean?
> > 
> 
> ADSP.HT.5.9 is shared across HAMOA Windows and QLI and there seems a huge
> code churn coming in Windows and we dont want this code churn on QLI.So,we
> branched out to ADSP.HT.5.9.c7 to maintain for QLI.

After the internal discussion, it seems this explanation is slightly
incorrect (at least as far as I understood it).

Anyway, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1282

-- 
With best wishes
Dmitry

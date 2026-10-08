Return-Path: <SRS0=aqNB=H6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D371CA6017
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Oct 2026 21:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD48E1F00893; Thu,  8 Oct 2026 21:58:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791496706;
	b=Ez5g/OCd3HOFWbu02vflLzxWXnKF9VNc6X27r67v0q1cFmnajRNSCTW1Vno/cNUVqeDK
	 2xRZmK3Ph5zQPOofUxrMJASM3RUCqwerr+xFW3PAgvIlO4tMePoXIRShF15jIjVlefbpt
	 2E2j0Ha+hwyk9T099x+l6NtzvlApeahuZYnl6oIKSu7oXI2wdl7lfvJTrUTzp3hzygI09
	 RmWSYjBRLMgCEtt0oBeGjczrjI3z4Ial8KlzERZeZf24udX87HF3Edtn0BVq31CNKggC5
	 b9MzD7e1ZoCJMlOsRjpq1ephb19CDWyUJa1YdY2nAzEVhnQ9Hl2QxtCzsc97T39EPBA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791496706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=;
	b=rVi1GL4p/H53eZOQBlrriDwpvCTvIXLr47tCPxUl0YkzUA1Hwp85yd4MNoOFDZideZZx
	 HzKbtsaaJf5IGf086LuFrrs78v8gU6FBrdzu2hTTcEl9uDV6P7YG3H3Bmon0EWrD3DJGZ
	 clDU8Vcfxb5HWYaFf7UA+UsB7/3jz1XxCLkvPA5AilKJ1NG6QY/GlqWnau/VG2qWjriAd
	 xdF6UFpD0FmUN4hcwbixDvbJYXTQy1KXY/QJT6nh2W3BYhY5U31XBQQH8rYdmzKqUzjVY
	 YnRZyRJDtBzt+HYgSacfzd0er9KEEx71i9EW1cAOz1CHQmfuryKodmqNN0/U13IRO5g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DPwZ89b1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmho74Qr;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76B3E1F000FF
	for <linux-firmware@kernel.org>; Thu,  8 Oct 2026 21:58:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DPwZ89b1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmho74Qr
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 76B3E1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L011R2976559
	for <linux-firmware@kernel.org>; Thu, 8 Oct 2026 21:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bTmDvHbME4TFPnudbIvelUAw
	a8csw0mAjHsQ39CULK4=; b=DPwZ89b1oSlNDZlbCEK4iPDSS/zrKliHuZtJtxjB
	z3kmBixlpcCWTTPBLHVyrPrRaHGGhwxTC4HGHiRjSZaRMeK83bNf4/d3vYaLh2QW
	9mRjdIsQNCQsZSgnOUjYtPMH6OweE70WVOi+wSEpBm8kIdV/CRzoMoiaQ102kkPA
	/kK7T9y/Qn7hnLVxNwVjMA8pJOL49ZXQrHLvGMjndb5kxmA/T6K3NA6SAAascDKS
	PRNCrw0LbXnTfAMd8y59yCCeRJpthPE6RnaCGUK2n0tSedUl/pzsVF/7U25OQX9u
	+2d5WLkf+KES/MQYMD7Rzksail5ygHERtleIB9xFMsDHIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu0sn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 21:58:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc5f70c8dso661793385a.3
        for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791496704; x=1792101504; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=;
        b=Pmho74QrCtV2CbCiZ/Z56G/dq+MlrcJiWdBaCwZteISHbnPYo6rkBXc6L3hKZSiZIJ
         4owCk1FDDpPEUWXIRbpCcQdSFE16MuNHLVzH4NZmG2Cx59nnydCcfhzV3waJJCDEtdXk
         927LBWbvzbRFPOyahp89S+9GiiKOnd5dUPN8TyQmqauZEcLRQW0aJDteavYstsuXXF8s
         4UiPkIJ0X0cWFMImz4nwKdh4EMOrN1fOzBImrtn2QsEN8pFtrtLrCcodlW6lLzSMggfk
         gxeDxVN83Eg7YvLUnWeczywA1eZyYP2E6jY/hSWCLEFUTwaqdGs0ETo1/xY3IWH+Z/KB
         9n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496704; x=1792101504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=;
        b=h8O7r5WiwK5TpVQ2N+S99OLs8LqPMAx3OySFJ74IiermTFyMsP0ef7303d7yO978mB
         ay/9ypwJE4YPohIuVq5Qg2wTc2SqB1z8eJXfMlcNIn0QGeXPxbXVmX7Tn6yi1aSQRpEO
         wScLOkNjteAbDlh8ogcBm5lr/+JCqJhuYrDwE8QrLu/zCWvN/0561LV28tDH4UPK8Qnf
         D4DacEscyMiWPjMqJi5o88CLOooynt/J4BN08xCK12sf5QCnT+viLL1gKHtuu1D3+TAS
         zbYP570+CCSKYg5Q7s4oUu1dSpnlUR9vZjy4gmsIFBTj7AnfgvSiN6JawogVTEC4rWE9
         hNwQ==
X-Gm-Message-State: AFuF++myXaygJrKRRm6Bso/1eTFnPX9LKgim/1eSA2OTilFta38OHaUf
	uvaIuCvWscyc17PCiN3jbJF3a2wzYzkqPK4Oa3ma14IHmmms21XIE/H2XqaXlV5tMc/odTxC8x8
	cXijOujCvrRPcWSL4VqX+VYhnrhHGESskcnVaJSITG6Yrc4Q7ThCXHp6kY3WeaRs=
X-Gm-Gg: AYBFou1W7ojoSQ6NAArjvlIODnppHDODoCsE3fJ2+xeJK63/xkTzSuyfppbsLyzGqxN
	aBAFbg/iccGRbw3vDiu6EJ5KhoSR0hKng7Hd7j3rgdfVJH9U2ltZ/wCY/yKWAm7burWrCtmWX00
	kzIFCJIhTTJdveDlNyPAvBklj4QrDOvhRZ/75qZudr01QQOZ88jz4b+ywnB17A5rINmtwBCZdnl
	LgG5AqusEnNa2wotVi4HqJzeas8ndp10ZK2R/0LwyX9H9AkQhlS3+2stI6OYk8yJIlpSaqUNP+6
	OxiSZd9rSCRVesMaD7Vnr7SNAlER27pKNLnamnAtfGqUvaQE2EtdDXyeFjp2OG+z0cKk09Fqisi
	/Q8Exm7s9w3OVt0RSjof39d40YwJ8/vhBIaxMrmYIvMgMIWb+MHLJjucVSYVnwEMxVpMkcCR99F
	pqEL9kUQp+JYvb
X-Received: by 2002:a05:620a:1b93:b0:93e:8774:fba2 with SMTP id af79cd13be357-93e9b7ec7d6mr1277725985a.58.1791496703774;
        Thu, 08 Oct 2026 14:58:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:93e:8774:fba2 with SMTP id af79cd13be357-93e9b7ec7d6mr1277722485a.58.1791496703267;
        Thu, 08 Oct 2026 14:58:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36004sm102345e87.8.2026.10.08.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:58:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 00:58:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261008
Message-ID: <afoydvkyh6kc3n55eet6ubszuw6g6q6mwtghfismxxxlvs62dc@cl6zxhem475q>
References: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfX3cupplWZZ645
 KqwcYa3VHmHnClRDv8lUnMxgSJzeLBqVDReLbUiGHWw53Zypfs8v3hFvd1b6vCiJBAa/rTidH2+
 hPz+gjGd6t3GFuowxCBo1Qzwt+tgeduQ8kcgaLtccAjD7ewLQDXfd7mpfzebXBlNyQM2/z/lOe/
 gq6pZZ8nV4MoDWnP9CfgvMvZGSVulD+MpsFbv/NB6PJ39n0MBx/1CpOMB4KQRKfM7y+HVKnBRBi
 9Wly3mHMthl4U4zGMLOFnXWOiQ29PAZqceM4UyYTc9R8fOMPQLu+JooCd43fruvKHtdBNTUzTwK
 hi67e7jzvQ4ufUznSCLOrFZOXECv0wDl3O1QNMw6uKc1PjaOFum705AEfO0ovSMMtz8xh3k2zry
 5nMN9CkKtOidzwmM4LJEHQH5JVAd7GTruM7EhQc2PG89g4ic04JThTCKhBbirFP6rL9XUsD+kh/
 q9jkg+ckltnLcGXMNNA==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac81200 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=qDMzh20vGZsPvAqjlPMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NVEgX9rVsUYeLy0T4unEj-XsqjqB1KZJ
X-Proofpoint-ORIG-GUID: NVEgX9rVsUYeLy0T4unEj-XsqjqB1KZJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfX13H2aiZvJd4i
 vxHeEgYs3v0lJKSUXeZ4Vt9FMtDbjpXi+Hrp+atms8V/aPH6hqekPUEOTfleTR/a2MrdsJvh0yQ
 lDMOyQ6i7xRd6wQll53jjX4IsiVmqUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080087

On Thu, Oct 08, 2026 at 12:58:46PM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> For ath10k and ath11k there are no changes.
> 
> For ath12k there is one board update:
> WCN7850 hw2.0: Add support for the Samsung Galaxy Book4 Edge
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1296


-- 
With best wishes
Dmitry

Return-Path: <SRS0=18vT=YE=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BCBC3DA6D
	for <linux-firmware@archiver.kernel.org>; Tue, 20 May 2025 10:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41735C4CEE9; Tue, 20 May 2025 10:48:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43CE8C4CEEB
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 10:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43CE8C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7LXRv025244
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 10:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VYULILg+NQGJsDNbdMR1nZRN2P0vNDPqMHFdt0ooYb8=; b=ewKkBHxEQ3smkkY2
	9Dn1qFsOsWmJy4JoVS2GGds5Ps2N1JbXWbv58cZKXXY03lJsN0NofalL5FwlQuWh
	ONbEx+1svgl4W7zukJh0P2sDGYmpIQtYnFVORqoEmZ3+Z1zM6iE9wREhf28FgX7z
	yIn2dXCYjiCQrjrdCKNa887fqLIObUWHSOqQXFdqNhzt2g3lrrMBHWWh9nD6AOZ3
	IECPlBczs5Yyr3bceqsFXGoz1QaBbpgEv2iS6jjDndVsoV5Vaa11/vusuzv/fBwi
	cMn19Ue1iHnueHUOw6AUdR5VRfIZ13HLsQzczlbVNusjPFOy0Ei8UczpftslZ//m
	HiI4fw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyqg5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 10:48:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d448a7f3so37553466d6.3
        for <linux-firmware@kernel.org>; Tue, 20 May 2025 03:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747738121; x=1748342921;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYULILg+NQGJsDNbdMR1nZRN2P0vNDPqMHFdt0ooYb8=;
        b=EvuZfQ1NPenrksZALE5WNALnTXEcXu/HTDstMyyKkdnuGEMbINdDpjQ8SaJTUU2jP6
         Pa9NJICp8PHBVNEOkda9BYahPg9VhNEZKkM3F/BP2fuwrzYqT2Mu7X0BXY+a9+5thyJE
         bbVcIfZnnpiQ8ekcb8Gxc0obfBOFowWkeIrBWxVmY9KW3yHm21ID7vX3sz3ksl8ZhjP0
         IAi1enVVZoj0m3/B9vXzo7s3orR3Mrc2YtTToP+zysAPmcGa42a1X8ShIWvy5Xlkbpsh
         MJf77FEjnwt2tdMUD7a4/YK0ME6QGipKoZN8Ei903UeuGWU3BOC+DONJJZn9Tp7iM+8i
         EfrA==
X-Gm-Message-State: AOJu0Yw/YZt5cbbztuFCGGxtMxQ7CyU9xPDhNR8rsypBef/hO8WLKAAw
	KA2brdtsWWSDUHlCsyJeh3xLwvFJLSiklrf55haF26+QcX1R9z3MPRnPeS68l1AUxknz/H3MHN7
	+f/weoPBL2W58u8NHz+63uvp2T/JMxXVIiV+aEdO2CWx1Gsmgszn72vnjU43rqbE=
X-Gm-Gg: ASbGncu4Hps4ZWdr0WleadMQ1zriH0CjtKGpLqW/QYnQBJfxcjgVTCTstJVxiS0RfiP
	sXG1bU203sxF5HgMTbag99+Y2nM6SJgcvUCRWCtD537MZ3EBeHCPg2rMO/AA98Uurlp2dR6l/e1
	bzyxj1eUSRaqs0k52wEwWGhNQLWvOX3LyX2krLKHAjMFBtKBTYGaYNM9lR+lhzYBQzndthv2nkA
	LUmX84kC/FeksdYUAs1UY382QSIe/MI8tgUH/44OvcjR2iWu0zoJoraCdsa156uf4S6nvGSRtED
	OwAS+4f0qQvtCc48P4sXKebXrhFjPJLciPaON292vfVbu95b1y57OlW1DLQN2PKMTY7fPcwlRD8
	=
X-Received: by 2002:a05:6214:1ccf:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f8b08c8af1mr289030916d6.36.1747738121052;
        Tue, 20 May 2025 03:48:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuB2A4H3NnkMN2WLKEjtz7ww85sudKZwWvtdVu/lSzJNkar+5B+eb5JW8R53uyfMeK3OvgvQ==
X-Received: by 2002:a05:6214:1ccf:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f8b08c8af1mr289030696d6.36.1747738120703;
        Tue, 20 May 2025 03:48:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f15fc6sm2287181e87.29.2025.05.20.03.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:48:39 -0700 (PDT)
Date: Tue, 20 May 2025 13:48:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, mukesh.savaliya@oss.qualcomm.com,
        quic_anupkulk@quicinc.com
Subject: Re: qcom: add QUPv3 firmware for QCM6490 platform
Message-ID: <netxlhikdd2jlievf7mevbbfpffaz4ttkjw6eykwvpklccoxbw@qtzh5hiqwcpv>
References: <7b30419d-e801-44a3-86a4-b18da83ad066@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b30419d-e801-44a3-86a4-b18da83ad066@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4OCBTYWx0ZWRfX0Q85l7/jQtYF
 hQx4CTNxcFd9f3kgFkep7/KUTnz8YROdRI5Y9v8LpvIGYOsi7QpaIx/JVugfV7ZGYNp1PUQsvFB
 y6BwaGazG9nUcvqNsrjRTI8wOumCQ6jFOp1HLpJwLmHbjGSeAlJ5c0wPKp43zs5XJIo84UUhKFJ
 keHFZpmPp7PExONxi0I0Jge9dlnt2Fk/1FkSH+mb7bTpLxTTbHeHPyYGdHP/Q0GRlhs+gVFCtIr
 kbGqUUbKIcdaphyKz0AOcxk4Z3nodsDND/MBUSr/5xFcpKYzG/oAVkwE8nA7PI2BnryU3w38z0h
 hfLaeX5eeJRaOf920bBa8VAGAxOZvGGQREeLpHsWueRS2EcXDFFAx3PI0qEPGmkOsJTKZxvTqls
 UI99xuSY7z+qQVXZBkKBdmfI5t2VfqEk1Fu3draduiuZEl07mcfFuoulMI2CRhcx8yadCyJ2
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682c5e09 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=ajKqya2mJOxvy7CF9VAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: KRkfG2USyoZTbSG_fGX-oTlASKUsvjei
X-Proofpoint-ORIG-GUID: KRkfG2USyoZTbSG_fGX-oTlASKUsvjei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=774 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200088

On Tue, May 20, 2025 at 12:51:47PM +0530, Viken Dadhaniya wrote:
> The following changes since commit 759c4acafb4a80d76885e4a1542229a27d677322:
> 
>   Merge branch 'robot/pr-0-1747425243' into 'main' (2025-05-16 19:59:07
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qupv3-fw-qcm6490
> 
> for you to fetch changes up to be949ef4113e8dfabafae6313f6bbe88520f483e:
> 
>   qcom: add QUPv3 firmware for QCM6490 platform (2025-05-20 12:07:53 +0530)
> 
> ----------------------------------------------------------------
> Viken Dadhaniya (1):
>       qcom: add QUPv3 firmware for QCM6490 platform

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

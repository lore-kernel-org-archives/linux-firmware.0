Return-Path: <SRS0=BA+5=55=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98483CFC268
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Nov 2025 11:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68189C113D0; Fri, 21 Nov 2025 11:55:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D94AC4CEF1
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 11:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D94AC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL7OKrH1390780
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 11:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lx00PkKsB1XaLj++M11LqgWHW1Xb6nm8rMfaZ+H+3WY=; b=HS5J+mRW6AJ8qmPB
	8sVmB2SoZESPWXWVRymAY4O7yiaVVCtuiqwybfi2ieWCiLD7MDv9y/VblVY3eq8S
	ds7dKag7qZj9GvLWqUSxjgeh0OZolqayC0v1dhioEE9oP3VOaaDn3XI3Ibfls1Pu
	/IA7TmbkOAqxkLrQurMFE1UAdg+ELlOKhPhPvOVXxi/p/U6X4o8dbVl161OTwz2r
	tNRJmL3iNRZ5jMMnbMMAYMNDhBi0wFVbiFNHRKo7k2P+FJ3J/0HMKn9IaXWhzsqR
	h/dNtii9h1fZh4F6zitCVcQ177gwOwnh5sSprjYHrnzE99hDTkBuUu8K8Wlp7QT6
	xAqaFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb532c50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 11:55:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee21a0d326so36819021cf.3
        for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763726141; x=1764330941; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lx00PkKsB1XaLj++M11LqgWHW1Xb6nm8rMfaZ+H+3WY=;
        b=U+iMv+6j2AwlWpBmx4ijpjg06p1ZpmO9Bq0N0gcOBXQX63cmmpUymJR+KeF9Gz6Y9f
         9LmKw4scljK7Wlv2aZaIvGDcfNI7Sfd9K3Ta/BSAG7gRbdfobhA6xN9Fsw7oGYDKzMBr
         osPWFIpUj6EKucDqQKZZ5Xk0Zxk/MURFj+01XP5D1IDXm55Ul/iSuNlFOFhvzVrpsGSy
         YHeW6m4pjsJ72Jr9X1PupRhwIPDsirnNZbBFADuZhHQLyuefU7y+7aMyYhoHseeIn45u
         GGowuPxvNu2KNfhY+ynKAPtr/wRbV0QuXFMbvK1vytGCFnea4l+/oypN9QzImPUZ4lu3
         fP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763726141; x=1764330941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lx00PkKsB1XaLj++M11LqgWHW1Xb6nm8rMfaZ+H+3WY=;
        b=KLp5cQd6ya6VTcdHO7BVjl9fd0gxp229402p+ur+MK/x93QNPkvASO4YSYp98nlZ0M
         XJWK9cB/OP69PNXEE4AF7jcj2I3DUpFaBYZ1W05/vp1ZrexkNXvn/+JRG3AtjtJIvskT
         45ejLyWBc+Xct64oslFEZIPR4ExwVK/UWQcIIlDVNmXpkf7Jl1bL7OF1d6TxDmHxdTds
         bWyHS976YSYyZcplC6iwN58B4Ht3HqWBfxX/hN91btpnQMT13NnGgK6jaSdlyHhdb4xE
         5ydhMZgSYTy36B36W4aqCCfbTLdWaX3mVFoN/olH38pKObtDxf7CGDfUq/vS29kFgR3O
         uo3A==
X-Forwarded-Encrypted: i=1; AJvYcCW0fszO4C9BQ1Uqatjs0x1jyrRyqHNknQYTaDwpX6rXahVkBpcpY+rCxgvp6SjX/o/gxAroWPW8fq+CPkvERQ==@kernel.org
X-Gm-Message-State: AOJu0Yz2L8uqCXG2n+H8hltwfYNTC/uc7Voze2nQ+LVEW7orKe6VqPXI
	yK305Uq2r3rdRf3yEjRefZvexXGrwGI1ZRWBwB9ZMYTYrkhycSPDjvv+Pbm51OcT6/fBIbtsz4q
	MLRFCBrdTvpJhGhYYeKhUyf7lBnLs3u8zDFpUd+THooJJLc92f734Sw2RFqdkHxI=
X-Gm-Gg: ASbGncsJcsWnZZ5Wg0vKbR5b2Zeomf0TIFCPhQFMQI1jjCw5YiAbRCL9ILuWP9rpow2
	xWm0/9oogPGLbGp7He0SGsEv0RY0pL6OEH91xNNbBZy2VVcZFKT21YGCg65vmoduyCQVUvMKe82
	BSaB6PeABbTr/OyJu460MqFDrhMvvgysmCvAQQ39qvWw9o39ytWNssXjBHfoZVIIafysz7AtjST
	CtkEE7yce2n5CH1MddCvpn8A7i22HjkLntT8i/n1w0D2FS4RP/VCSO7i2FpavTv0yw8/nuflIm8
	N30Al/OIU+k8a0Oa36ZSAZdaxOwj38uKvZUkYSKqz6Q0GkfUGFqfGv8+XJ1nd6z8pTmXZJmg8cM
	NRawhqDtHXf9r7hXKOuEwbYWdZ9oIorCbFIUQ5G5K9gDzY7uDe+L/e37irc8SfC0K0ObX9LClDV
	kYy6xY9rRo3ivOOKAkR8LqsU8=
X-Received: by 2002:a05:622a:18a8:b0:4ee:2459:3d6c with SMTP id d75a77b69052e-4ee5891752fmr21200941cf.58.1763726141428;
        Fri, 21 Nov 2025 03:55:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1ggUOQeqV9kraX7s+CqcOQnqGtkVOFYOoitispsSdqL2y1sYi56KlDe6upC5ZaQL7K0M/dA==
X-Received: by 2002:a05:622a:18a8:b0:4ee:2459:3d6c with SMTP id d75a77b69052e-4ee5891752fmr21200711cf.58.1763726140945;
        Fri, 21 Nov 2025 03:55:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75627sm1544445e87.5.2025.11.21.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:55:40 -0800 (PST)
Date: Fri, 21 Nov 2025 13:55:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Renjiang Han <renjiang.han@oss.qualcomm.com>, linux-firmware@kernel.org,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
Subject: Re: update firmware binary for v5.4
Message-ID: <lllpl7faucz7b7fz5kkehllezjaefplayzrt66bvvyq3e5sym6@katcv5fgx42h>
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
 <fa44f063-0f12-473a-98b1-cc601b4fade3@oss.qualcomm.com>
 <2b7be357-3a11-4eb7-ab6d-fb58c7909b07@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b7be357-3a11-4eb7-ab6d-fb58c7909b07@oss.qualcomm.com>
X-Proofpoint-GUID: p3E53aZYRSznJZimYxEnXTe_H6ijSUva
X-Proofpoint-ORIG-GUID: p3E53aZYRSznJZimYxEnXTe_H6ijSUva
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=6920533e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=WWF3OLm5rn8f5rxomHoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MCBTYWx0ZWRfX8LfENxnJG/Xm
 9o5SlRXQ8KikQ94UDhQbZdeHj1ah79Z1IHyrSnfJCQUvSTr82V93Ud216PKkLBdWVe4lBudiHza
 E+i8xvUJAwCVRxNWqWokmRnU4wmHcja5Hk/F9h1XSqo5Vj08hk5ofRyLeqVS6M5E/4BRaP+syzW
 55qw1BLNKC3zsvXkVIT+hl+z0ATEdDG3RFLXEPPiz5vkgbHpcQWWIWLVm1b2IxlMof6DbvTyNVG
 25GlkHf30k3OE9HaN8bqUm6sumr84f9xPkJYDRhqU48/kXDYT3yTQZ6AYagptcXMhJXLIRP5hsD
 BvWbxk2VciCDZESX/Rygp7mAWE9Wbys8HnipJbBj759JbT8Qbgk2tUjGOkn3C1/hBcXU7Cumzzf
 owGEz8tlZxcTw8bh02SMHiJ5SMMG8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210090

On Fri, Nov 21, 2025 at 03:17:24PM +0530, Vikash Garodia wrote:
> 
> On 11/21/2025 9:27 AM, Renjiang Han wrote:
> > 
> > Hi Dmitry & Vikash
> > 
> > I have re-submitted two changes, please help check. Thanks!
> > 
> > The following changes since commit
> > 6fc940781a013ad837ed8fea326d2b897467bbc3:
> > 
> >    Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11
> > 12:02:02 +0000)
> > 
> > are available in the Git repository at:
> > 
> > https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git update-
> > video-fw-v5.4
> > 
> > for you to fetch changes up to bb28dcbcf9867ebeda6a41d575656a737c24f32f:
> > 
> >    qcom: venus-5.4: update firmware binary for v5.4 (2025-11-21 08:55:41
> > +0530)
> > 
> > ----------------------------------------------------------------
> > Renjiang Han (2):
> >        qcom: venus-5.4: remove unused firmware file
> >        qcom: venus-5.4: update firmware binary for v5.4
> > 
> >   WHENCE                      |   6 +-----
> >   qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
> >   qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
> >   3 files changed, 1 insertion(+), 5 deletions(-)
> >   delete mode 100644 qcom/venus-5.4/venus_s2.mbn
> 
> It was made quite clear to put up the history from versions #58 all the way
> to #62 in the commit message, still i see commit message does not capture
> it.

No, it's not required to capture old history. But it would be nice to
point out the reasons for the change (conformance to ELF ABI). BTW: what
is the actual alignment requirement for those segments? E.g. on ARM
systems code segment must be alisnged at least to 0x4. Likewise data
segments also should have some alignemnt (again, 0x4 at least, usually
0x8 or ox10), otherwise loading data from those segments becomes very
unefficient.

-- 
With best wishes
Dmitry

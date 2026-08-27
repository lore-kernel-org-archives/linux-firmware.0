Return-Path: <SRS0=sjKY=GU=oss.qualcomm.com=xueyao.an@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F83C61DB9
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Aug 2026 05:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 165B31F00A3A; Thu, 27 Aug 2026 05:44:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787809452;
	b=fgrrLM1Oab97w+Y+N/JTVMIOg4MaPxMrRYu/YkWQIjsRzsAsKNIApU0+a930ZVz/kWzU
	 V2scwyp+/+tSwUvvIDh0RlHdW6SUjiXR6ErJ/nKE+Nfk3fy6fi6RaZ3jzgzi1shleeuAy
	 mM59QatMwQeeQx9pYFjMSIIHUXOVm3S4Ajb2QbW6llOwQT6EjLwQdMrYbKiOFsZxHVb+U
	 6i3pf6D72dtYCZSnvNCar0iBC+ZH5drp3vlP0VUWK2r1d82QAXw5wNMNp7amabYyKJoel
	 +TUSrg2LOGenPbYmo5md62XTs7PQNnuTYm5U8pEHV8CiHIV+BbQ7gNSLdYbZLWWXO3Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787809452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S2VO6RHHobVjsDgKuhBx2HhIoYsrJgCTMeocpemg0WY=;
	b=p0iHc+B3EzXlpkcMOWVhWVhH4X88WyMkuOYsSUV5aePwpy2EvkR5nMhsPxHniZ76Qo9Z
	 ELtxZL5TEvsU5uyOXcr/3JFLLcC98rptMFmcA1puPQdhOrUnAJs2JABYpkd1BYsX7edTM
	 1eBJJqPD99GIIrGFd+4e8feXFL5rpVJLmQ+CMJfmeBUdKlgiHSTY/Qp8BXbtL0uh1Kt6p
	 BnyNQj422Y7ejICEWmjsLXTff90NZQwnR3jaUItB321MBPQRbcXtTT6v0j0TTeEjugybs
	 xdH7HllWrAwcPU10k8YBIV9Agxt7KUCuhJiZXWAnLtVtB2TEeaGkcoWmRY4K0XvFyTw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XhNTpZ7n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WQHT/8bX";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 728071F000E9
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 05:44:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XhNTpZ7n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQHT/8bX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 728071F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3ImWg2216639
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 05:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S2VO6RHHobVjsDgKuhBx2HhIoYsrJgCTMeocpemg0WY=; b=XhNTpZ7nkmsAfCzC
	hPCeoQyxxzBTqrqtUe104mt7FdJOWYzEVtE+F7CbSFoFlmh4NFFt6Q5PMo7jVKMd
	DAI4amGMcTCXNUEk1/u29d1+Xj/+ygvqzF+UzJyOudvqrvxJox1QFmuo/LTey08m
	h3zIS82OXBFdfmmw4f1Jkq1+oZLD4MS8jH/nBMGr7n+vtjzIST9UDJcR9sctxw0i
	wb2/9KzzIlqcoLDsu9RbT91lceKaV6IWt7yWdGTk1PaWuvp/RrwJFegaf7bW92QK
	R11VlGFs7kKI/I3y2hN9VD+eZCjHLKO43Ipj+/fj+1bB73xZshsi0sPgDzeQeXMM
	DUy70A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u3e44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 05:44:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so4008527a91.1
        for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 22:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787809450; x=1788414250; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S2VO6RHHobVjsDgKuhBx2HhIoYsrJgCTMeocpemg0WY=;
        b=WQHT/8bXNrPQ9OPDaKOA4C/IdVisaSyp2HGkdREZ3KrEOLLtEgh0EX7FsMP/I5MZ5/
         SnpPsU6yDROBYiWNlh8ugRnWVt9LL6jsAnVLg8m0mCpOW0MZNuIegaTN+o+L6Yrz0n1s
         YmHT3XUa1w6JfHCOjQVykBtH8pJg+U6nCxmMEvyP5qHUYpl7ek+DoBIskOANZ1KE7V8G
         pklesaoJ8sIDsiIkhwr6+c+7UWZ2CoXybWElYNU7g6fCPSvYqbqJCJsyic0pg6aKcNUW
         oCKC72M9FMYTcqGeV5FkDEQsKsS1IWcLBdoVjOJLx/QRGh1affwP9PUtKjDUnBNR9d/8
         8X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787809450; x=1788414250;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2VO6RHHobVjsDgKuhBx2HhIoYsrJgCTMeocpemg0WY=;
        b=bHLK0Af+4eq9WyZkbEKQr7Li/0Oz3Zew03TRFS+Qibd1PV/oMxm19skAH8eeJqC7Jt
         u8P0n27CCfFf7M4/a8HgUAvbkVpF9xyiatYfZjTYk4XVIr961QYImPcRWZngkMyLmG4O
         bpHh15Racmk3n1oDBSrNDmLWrvBA5fkaHp20W/DTFzI10iADnIpGdhlo1LjbIzhT22dt
         ywZG3VtiM36I80yXg8ELUWU1RCe3atydo2sHWa9KUDPVkvfrO03qAePG4lMu2lQm/Fz4
         V1h3Jv1EwLGrdD7W0f2myzyEwCJTdmgfRonG+LlQYTVE/ttOseayaLfzsdjt3WXuC03t
         afuA==
X-Gm-Message-State: AFuF++nLX6/GULERX944JrsgOOKSXHOpl7T9Ek9sv0s6RiRO6sKkc6hD
	uPMYCABwoPwv2GDmTIPUbF0JSQdSNQertK/qV7Cda1jXoJaD59GnNP34G+0REdgVV45kW+cZGWU
	VZ6jktTwNV3jxqaQjzk8RBqR+9t2gxkkL/zpTawjzPuQ1HBpxn2pHVdJkdQFMd7M=
X-Gm-Gg: AR+sD10xRfj54xR21uCQUFLlNb19+pRVz1ghIB6rZzbm/9sJIOeXFfv2SXMZ7thp93v
	j/wLN0+CUpXeOiEejIOtjD1VF2COvvQMY7jMKNioVBA3bsHQetFYW7RCk35L98P0CMsuoNSv4Qd
	K/QbKmWDVhZL3ebwCYtEAyWzFd/jJtnvdEPpHdB3v+iGTAvnd1sEF5BC5NHDDV3ewjzWehP/0Mv
	kUFwzw+TjeizSvo4X+C7DhvMWS3q8Lz96ojAyEOVo+owLbIDpoiZ1+l2tl/jObZShyNLt3y9GgZ
	qQfLZ+xlsXzkJKKp6kookstDHNfeUaMXB/ucjvXrk19JkMhxnPiHaG0kEoGzMS7rS3KPI2PH1HR
	SVbh0xXN8JMOlEBPQlPZoSVkhrpdd0cGd47+YnEXcmNIjKIWNNUf8LpITc6ffp2v/6iZD
X-Received: by 2002:a17:90b:5890:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-3966d83231cmr26845272a91.13.1787809449449;
        Wed, 26 Aug 2026 22:44:09 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-3966d83231cmr26845201a91.13.1787809449009;
        Wed, 26 Aug 2026 22:44:09 -0700 (PDT)
Received: from [10.133.33.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea7fa9sm1311910a91.4.2026.08.26.22.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 22:44:08 -0700 (PDT)
Message-ID: <f4ff769a-ade8-4fa9-bf26-9a5e58b34285@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 13:44:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Nord Linux-firmware: qupv3fw.elf
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, viken.dadhaniya@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
References: <36e1b825-7896-4308-bcee-f695149b3c0b@oss.qualcomm.com>
 <yoju53omp4qhbhjix2seufd7beyjegbnzjinxc2wtljexonfq7@6fgc7d7ckyqp>
From: Xueyao An <xueyao.an@oss.qualcomm.com>
In-Reply-To: <yoju53omp4qhbhjix2seufd7beyjegbnzjinxc2wtljexonfq7@6fgc7d7ckyqp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA0NSBTYWx0ZWRfX2b8BMZYTExv9
 a61aBeKiA5AuOAA352Twk7eu1PZYjfKUTcqibYWu8dSOkqoofOqb6apMsUQZhdDQ8zNhQJYG881
 HFPd2oCeIQBgUBz/gJboNKpyr9rqHVTgv77x9dF+W7Zna0UTxLKmWL2/uGNKc8r8QBKUX90nqge
 b9BE42zcqfwFa2Ka5hwEge6Bk680x4b/g0Crp9/F05d/klbv10RfBTppKMFReVRiinYYgrqGrZc
 sxBi4rOZzDgTNU1FOt6olOoWwD1oXHKHOLuULeEtLnxuOhewRFRwFoYfzXDswY5b1FBJYZZqawW
 w86jLmXboQHEeygihEQGXtzMUJYSCB/0a/kEwv2taq3W0geGeC7BiNi3FvNeGXjMaN1ZsuuqDBA
 NRuy4NxDXStlV6+ckkDqUvj2weYmZg2uxVx5oFoV5BZeD7wjZhENT+5PGQACN2V7GGwrHW1K8MJ
 pelFDD6tT9wY+uffwFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA0NSBTYWx0ZWRfX62taSU1fKyo4
 oBUZrSBCXMsmHuS4RMPty64DqglG1p+feSKVaZ94CXMyxAf+2vb0Ngw15Vml4ix2Jt0u17vZMnr
 lWIV6ty7h0x1rQPyHIucp+zeVVBc2rc=
X-Proofpoint-ORIG-GUID: LLSm9osG4LYGJINE70YeXq4XV5JxcxHc
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8fceaa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qC_FGOx9AAAA:8 a=zh2RdKDWQ407sKpK2dgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: LLSm9osG4LYGJINE70YeXq4XV5JxcxHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270045


在 2026/8/18 8:55, Dmitry Baryshkov 写道:
> On Mon, Aug 17, 2026 at 05:26:08PM +0800, Xueyao An wrote:
>> The following changes since commit 583d336ee7c2a15fd9e92c223b147d30737ec04f:
>>
>>    Merge branch 'intel/guc-v70600' into 'main' (2026-04-02 18:58:02 +0000)
> This is a commit dating from April. Since that time we had several
> releases and a lot of commits. Please use a more recent base (Gitlab
> points out merge conflicts with your changes).
>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> qupv3-fw-nord
> You are extending the entry which is mostly sorted out. Please keep it
> so instead of stuffing your changes at the end of it.
Thank you for the review. I've rebased the series on top of the current
main branch to resolve the merge conflicts, and moved the WHENCE entry
to maintain alphabetical ordering within the existing qupv3 block.

The following changes since commit 01205307636157a12c29e6a774bf83b218732050:

   Merge branch 'sa8775p-fix-sig' into 'main' (2026-08-25 22:03:45 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-nord

for you to fetch changes up to 899b64a8e3242fe675db0100881dcb0611ef4009:

   qcom: add QUPv3 firmware for nord (2026-08-27 11:39:00 +0800)

----------------------------------------------------------------
Xueyao An (1):
       qcom: add QUPv3 firmware for nord

  WHENCE                |   1 +
  qcom/nord/qupv3fw.elf | Bin 0 -> 61516 bytes
  2 files changed, 1 insertion(+)
  create mode 100644 qcom/nord/qupv3fw.elf

>
>

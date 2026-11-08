Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD8606A323
	for <linux-firmware@archiver.kernel.org>; Sun,  8 Nov 2026 19:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KuTifvIt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyTQ3Myn
Received: by smtp.kernel.org (Postfix)
	id 311CE1F0089F; Sun,  8 Nov 2026 19:27:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794166023;
	b=3D/trxKEaAy9r8UDDYRgVRI34C2EuUxEe2QK5vOvfXVTredICjlmGyd8pwKEFX4v/If3
	 BHZwog8wwf1xw3aAML7xGVRY3uRlbclk2H1nQhRMaNGvgYBOe3hfoioj6DlyMXrjS/0Cp
	 A+J1ZluU1Hw9q3unb4x0MmcAuCf/uXUyBY3eDte13xFBH7p7AhrPsGxbgHJPLl2Z3Wmhg
	 DjvPKYX/kZOwZQ8js3RRrfH2YcG2Bu4NOzbSJN5Ty0gpXh1YAkyZI+eMbU2HlPE+/nrY4
	 MIbenkC14tG1EAUI9REGRZVKTwOQgbz+T3JuUSFwXDwg3hnCyudYhTGv7M/jk6MXz1Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794166023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7MvBQP+RPZdO+4zBMMId3NGJk0bGAwDV70faNQFbJgk=;
	b=iGki8uBsjswWqeVyPQuN3Rq0jbpKbrNaNTj1MuD7Lu581HSdqAdG2exUypIPEVIjN9lz
	 0RKMCcD6d+C5DaztaTJQkZV6FwI1ci3cI95kw3fX1P67VgEcS8sUnV8RPfnOTcy6gaELK
	 VPDQeGebH/CCI+975yCwS2Pp3piJPNLsgVdI40buQtH7CEaTMb+np47Dp6l9L0UYqBj3d
	 c1ph94CWH6EbKMIrVE9K+5WWAtsFq1n12pLdmFE3CJhX/lnx12cEeWq9WaKd/TYEE5/Y/
	 dD00Fjlh34q9AlFCRCwtWJmEYgzjMU/S/FHtreC4UFHVoJtJsODQCD7y+D4NVxrJZzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KuTifvIt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyTQ3Myn;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F73B1F008A1
	for <linux-firmware@kernel.org>; Sun,  8 Nov 2026 19:27:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KuTifvIt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyTQ3Myn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7F73B1F008A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8HpjnW3072506
	for <linux-firmware@kernel.org>; Sun, 8 Nov 2026 19:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7MvBQP+RPZdO+4zBMMId3NGJ
	k0bGAwDV70faNQFbJgk=; b=KuTifvIt+hAvDbSgw5axZJvcmoRBKIUc/PerbkO9
	CmkL/TA6swytHKf46WKJMBbDU1lRtwJIRp6AyxKWIdqOhDs3QXyWzJA9BPvaMzcl
	EPt+JCd8H/mqtat+oefZ5TYi/5fcwfHWbs52Lg6gvy2aO9nJ6eS5maPb/F9oj7kJ
	gM2h7WHX42jT0Btp3Q+YIIOUu2s7igG7L+agXPGwEdIzcw3cBUUfivO+BQXcCmC6
	/o3kxH2szS3kRAEIeb3DSlnUBv43UQbKauyBMQOVs9TBFSGwuMEyyF5LJ74Q8gTV
	VLwdS0hRLKsWU/9BLuwUbpqnK8/yhgNvWd5WY6GYfIGXmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf3vv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 08 Nov 2026 19:27:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so39966385a.1
        for <linux-firmware@kernel.org>; Sun, 08 Nov 2026 11:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794166020; x=1794770820; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MvBQP+RPZdO+4zBMMId3NGJk0bGAwDV70faNQFbJgk=;
        b=XyTQ3MynsTwlYaQB75R2zemNKHgw+dWtaWppElGfxoYCUPpxu3YwPGT9HC5DcBM6ZX
         Ax6eEkA1IYivGBv3dxqudtHZ80Y9/cgF1W3SvzuxLM/ftvifodi4cOuPBjjhvCx4qKrF
         QI4rBAlWzNcc6LXbWzhTTSXToDUot2kaDuiGjXkSdnO13MFPuYtuvyUyBC8y8dWsuTqZ
         fDxdlPXdjL6WawcbvWWZYeTCkQUcr7x627ihlw0IsAKbFcmT1x7s+EsZ30zHRTxfV6JY
         MQvSgE5BiBKLavO2NO+F0Se2ZjdGf+6Pclc9VNezT9QebFYedQtyWLB1IsLb3agls7fS
         VIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166020; x=1794770820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MvBQP+RPZdO+4zBMMId3NGJk0bGAwDV70faNQFbJgk=;
        b=kvjd5DXQzlEW4U8BlUSrq5LJy9V/4VQHK/GIw02ppzlM2kDq3/ahVFA4kQFj70J4mf
         5e75NB9uFO/Ql+ntHyOzO0aayQ3eT/aZrg4BPpVxsXDxzSd9zRDHtRwcZWuDGa8TGeZ/
         wI6QWXDnVhuciobtdN+RZIfv/JfiIVvCtd69jQiioAOVvY/5HLyt5e86lDMJmOph4NNt
         tJGR1k0i7AUU+9+XGx6fAh3bDtiCe/gpgZm9YRhUlBiL5qF9oUjSX4/yjhFwoULqNm1p
         GSyc0e80JPSG/KsnjBw/oCwSTmqAkG0Bhj2X0JK/C3LkzL/ZjIhfpvo0fJK0YpMGRCeU
         SD1w==
X-Forwarded-Encrypted: i=1; AL+hErGN/J2w+QDP4k2SuwW1suKZCj+Ibymg60cmtp0MLOOI3cWl8hVRiZJ9V5R1zssnubMXJ4ZXkU6cpaY8RnelUw==@kernel.org
X-Gm-Message-State: APuU4Z+WQozviE21fmtbYRvq0TJFqaeh/xLQ0NF/hx25sGDET/Qf3tT9
	96G6T4IBvaAQCL7XGQUeBTDMiLB80xgv/IVcgv50KgA0uiu4jMrsCtoI4yoHEo3Pd8FkjYEQQIX
	3aqIDobyBnHS9+Ihj6t+WnZB+0E3Pw2ysRT1qfltdGisTUdsQqs4EvQbZCOFTLJg=
X-Gm-Gg: AYBFou35hOgWKJuoJvczmKI/VHKWoYrInRlkotc3Jldr7of4MYbApd8sHsSzS2viBXE
	siCfomA1iVIY+UJz0jBxzKbLSWgod2D71VTsDCmo5kyfnAl9uNnTk3qLn7Ckefz1MfFs6YxWHxv
	jT8O8056Tu7smhT3gfYNAlyBfI+bT7zY2zPqVmyhLEeGhwW02+CNUjkPkoFdmdzYsNREs0lARtj
	6omANTwEft4vgdrEv77DMNE+vc5IWJyAENoGZf3c/L8FsdRqLHOQiQfMv+9YmSUNF28T/6JLbPT
	kjK5a9pirR2Sl3/c4X618XLqmLp8hT9Tm/5frMmQ4F364p0jAjwIY0/91Gg2YZxcYx2SelTzJDj
	+65k272WnhG9KO48YCLjxiPsmUQthY1cURBKWwMk9SjP89+Hz5TpzDe0Q/cGR31RmojcOSaSyoY
	ejve2x3XTRZQiv5yvn9IfZ4HGpA/PMEvTov2Tj6dnRzjUT7a2fVrDDHrvWNrWI
X-Received: by 2002:a05:620a:2911:b0:93f:38c7:70f9 with SMTP id af79cd13be357-947841e8384mr330880385a.14.1794166020378;
        Sun, 08 Nov 2026 11:27:00 -0800 (PST)
X-Received: by 2002:a05:620a:2911:b0:93f:38c7:70f9 with SMTP id af79cd13be357-947841e8384mr330878185a.14.1794166019915;
        Sun, 08 Nov 2026 11:26:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3adf9e0f50dsm5053111fa.16.2026.11.08.11.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:58 -0800 (PST)
Date: Sun, 8 Nov 2026 21:26:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>,
        Linux Wireless <linux-wireless@vger.kernel.org>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Yang, You-Sheng" <vicamo.yang@canonical.com>,
        "Hutchings, Ben" <ben@decadent.org.uk>,
        "kyle@infradead.org" <kyle@infradead.org>,
        "Damary, Guy" <guy.damary@intel.com>,
        "Dreyfuss, Haim" <haim.dreyfuss@intel.com>
Subject: Re: pull request: iwlwifi firmware update 2026-11-08
Message-ID: <towutnuzzi5hyivntvtiziegrsnxgqvotaqzlhe23qvmuuvifo@5jlrsmfb4tuy>
References: <IA3PR11MB721313297E7927E041F027412AA3742@IA3PR11MB721313.namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA3PR11MB721313297E7927E041F027412AA3742@IA3PR11MB721313.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA3NyBTYWx0ZWRfX4ukyTQnK7Coi
 O8OfGeIqb2aGokVERBDyGdmuzHWHqK2abyFfUFOiDz7h9BhuqjJJhuCeDMMf4cYu0u8xe+Eu6ts
 c4lSzOVlSkmFrH58c0HQJBVTmmLBD2o=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af0cd05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=7v8lMnSnM1fuFDcAtwwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZE3FhL__jbsErDekheLAF_UlrF4e-_Yz
X-Proofpoint-ORIG-GUID: ZE3FhL__jbsErDekheLAF_UlrF4e-_Yz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA3NyBTYWx0ZWRfX9EcCYzUdn+RA
 9O0NZwEipyA6nMmDdyrxbVhgsJ+dlpbMmY1eSxqNTaQ8B1N8qAA+wIVdrMc/r5xMIJxR3lp1HLa
 VH4gApAOEuoED05KtzC9x5+n2s/tKA6TjDLFeDSBDwJMSPHQIB5YCWbfJC5vXC7SySjuksAWnj5
 KC2wTjwj2aeBGuWrOxPVfg5JeP8XeCCvxiheGaTt1tNJzvMnzMOWn4qxuPGj928LCNXP069zBak
 EOeiLlQHSC6/MieeJN7gw609G53kYceQNSbw3Tb1PLXeb47LfE+gor5TzULe7nlIOhqy2MqQuV+
 prQGcXqmIwtxINwSEYZitouNAnu26t3I3Cuwrs/P9tOS0Y/l3cewJS2vN6tQrW5vA5RDaKpeJb+
 hvXDGGMXLnXCA3CtkmXrmvOflOKdQ1qhPfQOz4Pa2pDMmHFWUzgSiQ2425awScXjUPTtgwnIl5z
 qHxQhIWjXly/NUDMlpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611080077
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 08, 2026 at 05:28:02PM +0000, Korenblit, Miriam Rachel wrote:
> Hi,
> 
> This contains firmwares for core 24.90
> 
> Please pull or let me know if there are any issues.

Thanks ,merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1370

> 
> Thanks,
> Miri
> ---
> 
> The following changes since commit 6d6bffb1d85a1fe077f26853edce482f6c112f2b:
> 
>   Merge branch 'amd-pmf-1ah-m80h-ta' into 'main' (2026-11-06 17:58:46 +0000)
> 
> are available in the Git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2026-11-08
> 
> for you to fetch changes up to 8a672ff527bc3bf7c3797c3cce50fde17b4e3c00:
> 
>   iwlwifi: add Bz/Sc FW for core24.90-60 release (2026-11-08 19:21:17 +0200)
> 
> ----------------------------------------------------------------
> iwlwifi: release core24.90
> 
> ----------------------------------------------------------------
> Miri Korenblit (5):
>       iwlwifi: Add cc/Qu/QuZ firmwares for core24.90-60 release
>       iwlwifi: update ty/So/Ma firmwares for core24.90-60 release
>       iwlwifi: Add Hr/Gf firmware for core24.90-60 release
>       iwlwifi: Add Bz/Fm firmware for core24.90-60 release
>       iwlwifi: add Bz/Sc FW for core24.90-60 release
> 
>  WHENCE                                        |  58 +++++++++++++++++---------
>  intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode    | Bin 1406576 -> 1406576 bytes
>  intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode    | Bin 1323296 -> 1323296 bytes
>  intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode    | Bin 1406592 -> 1406592 bytes
>  intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode    | Bin 1323312 -> 1323312 bytes
>  intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode   | Bin 1406720 -> 1406720 bytes
>  intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode   | Bin 1323320 -> 1323380 bytes
>  intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c107.ucode  | Bin 2163752 -> 2164040 bytes
>  intel/iwlwifi/iwlwifi-bz-b0-gf-a0-100.ucode   | Bin 1837584 -> 1837560 bytes
>  intel/iwlwifi/iwlwifi-bz-b0-hr-b0-100.ucode   | Bin 1584768 -> 1584768 bytes
>  intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c109.ucode  | Bin 0 -> 2042284 bytes
>  intel/iwlwifi/iwlwifi-cc-a0-77.ucode          | Bin 1368100 -> 1368100 bytes
>  intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c109.ucode  | Bin 0 -> 2079912 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode    | Bin 1752976 -> 1753076 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm        | Bin 55072 -> 55072 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode   | Bin 1605016 -> 1605116 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm       | Bin 27820 -> 27820 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode    | Bin 1539836 -> 1539836 bytes
>  intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c109.ucode  | Bin 0 -> 2241720 bytes
>  intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode   | Bin 1811508 -> 1811484 bytes
>  intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c109.ucode  | Bin 0 -> 2140784 bytes
>  intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c109.ucode | Bin 0 -> 2269856 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode    | Bin 1737012 -> 1737112 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf-a0.pnvm        | Bin 55152 -> 55152 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode   | Bin 1591984 -> 1592084 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf4-a0.pnvm       | Bin 27860 -> 27860 bytes
>  intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode    | Bin 1527004 -> 1527004 bytes
>  intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode    | Bin 1446036 -> 1447372 bytes
>  intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode    | Bin 1679080 -> 1679180 bytes
>  intel/iwlwifi/iwlwifi-ty-a0-gf-a0.pnvm        | Bin 55020 -> 55020 bytes
>  30 files changed, 39 insertions(+), 19 deletions(-)
>  create mode 100644 intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c109.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c109.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c109.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c109.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c109.ucode

-- 
With best wishes
Dmitry

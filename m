Return-Path: <SRS0=HMsP=FY=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC5C54FD2
	for <linux-firmware@archiver.kernel.org>; Thu, 30 Jul 2026 10:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BDB31F00A3A; Thu, 30 Jul 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785407813;
	b=pLJF8K78OE4NDs7c6XlmpmKDGDidRDDrPy/KP/9JGyZZzvNTGqH7lJv3yWKliMpjC6QY
	 tcwjA191K3YwhAYWWXQ2zubf2sh3eKChKp5pvrkMDCa4vWV27tcCPB/PRAmukFjs2Suqg
	 Whs/pI0xW2OCQaaXDCaQupgK/wWWDhTedco5vyGoMgeF61f9kXyjMDp+Yq2zCfggxcFyN
	 T8DZw31ofCRL3MOr/sExvqT/lA29hl5cEVR+AO5L4lO5sMWb5OqZa/7/o+3Y9NFn3wkkL
	 jO9Ono39GU3/+OwANhMRtlW8awn/fTpBVwi4BF87suj7BRngYgxD0qvJvtTti4GZLQA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785407813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=61RB6UbWnzc694A21zvuY+TTg/j0fWlTCaad+pYY0cE=;
	b=j0BszJO7WvJpILuBQL2gLYlVI1+Z20F3lMMMwgkjtUmj64er7GHCrlDnFv2dT0BEttZM
	 JTpDJ8qyGZaihGZidKenhYN03+2HWKXQ3QkciIu8AGOTQPieaSc4iElHQCW68GlHezfj2
	 I9rC1iS9jfa/0QSAtK1MvRtB10OP2XCo96q/w46eMSLgmIY+DQf0PDKnAOObgpa/ICOhQ
	 1yA/Qd2Zrbp3JYnJCqqxX3ImjNoUah2nugiPyEahEA1kPgLrqFFkXyVZyrLiBIoZ3Smcq
	 9QYCJk4hghkdwQx2B1UqvUFvklPN/PwD+PfBjyp++9NUZ11zyHdhsidw+1pOwN1FhaA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcV0ZQda;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNah3Mnn;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6B641F000E9
	for <linux-firmware@kernel.org>; Thu, 30 Jul 2026 10:36:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcV0ZQda;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNah3Mnn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B6B641F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2fLe497546
	for <linux-firmware@kernel.org>; Thu, 30 Jul 2026 10:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=61RB6UbWnzc694A21zvuY+TT
	g/j0fWlTCaad+pYY0cE=; b=LcV0ZQdatH/z4vwRwURbA6pSd+jJxJyJfobvla9+
	uNl6U/xXhVqIFA+L3XiBVaDTaVA6r3KkW/n7YDnUL5dXRQzKLSBc3bZiIVuB5i5X
	wJT0/xz3VxGBxIhnFNM+ru7YSwbJbp0o14MDH9R+mQkye944XnBEi++VUbTm3ZgM
	ojhN8UDBh9hUyC3EsU9UlS0parmmpDemZOsgVaK57+OEupSRLfzPjsOTiesE/JUq
	6du4ODiWL5E14Lq9X1eO+yBAcoSyUL5biLmxhpgkndNhqIh4J7+8xxwfegkBZPbY
	5mriwFIttH2iA0LROlgdOC4r5MXVthAS7pXRZbnL01vRKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr4ckg5ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 30 Jul 2026 10:36:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0f0a0760so40407211cf.2
        for <linux-firmware@kernel.org>; Thu, 30 Jul 2026 03:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785407811; x=1786012611; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=61RB6UbWnzc694A21zvuY+TTg/j0fWlTCaad+pYY0cE=;
        b=WNah3Mnn0z/aBOTYsrPCUrituUGeZOyL9a4Q9uGtBdwq4skpsNkEWrwhaKaJ2ZwQxy
         zHLfWbD7IsNg2II3KFz4q3wKjXa1WN/m0ff/ahjTkPS5DiScHwsT/mQo65xsWXjqSPcr
         0OuHDggaXx0nEeVwIabD6+FMl7PsIyBEKp3OaQKx0VyDPw+cmsfqoVc07F8q4SCjWUxl
         w2Ds6gEUhIxeLchqNRg3k3bbFtU5Rhqf9nqxdFhWyRtN97kX+FaE6fCMAyNiVPNVZxPB
         GnIU7XJB4c3mhroEIDqjHNB0c8Y4mv3oOM27ZvXU+F9zerRInYGlpdpoiMq9i3krNPpw
         oYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407811; x=1786012611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61RB6UbWnzc694A21zvuY+TTg/j0fWlTCaad+pYY0cE=;
        b=FBf36TwKwac7wmSJ4MxMnZBtUxUKRudKlB8FPh+noKPr/ZbeyW5usp+eNd2Ebn4Sqt
         iV8/7NwY3R+b+WGwnJvg7UKRn2/MoxdH4aV/HeygL/mCRVowBM59xV5H91RcomwHYoz/
         WRobD019C1v6idil5Kar5HR3SIXYRV53qZ1cFwmrT1WBXSB4wY14b3Gu8ldUKLsk3NhB
         olTHFchBJe5f0X3Dls7ctPMa99T5RMGBFIGsyIJAD5OEnlaDUaIShc4U6JrpYRzqesX0
         qC5VKE6t6vXHANrXp5Yr6KMB9BKjUaD2BRlC69yEHy/lMN5958yWhpEQBwQYQRSI//XB
         IUOw==
X-Gm-Message-State: AOJu0Ywyt3n3Ma1m5jYE6Ol4L5xztdB6e8ZXozAa41h5m/+T1GP9KfGM
	89Q+940kaS5wYsa+s1H6RY7PWm4eRlQ5gfNoIS9l7y0EYCZQri7yN3DCOoown2iyZ3b6cJa4Cxr
	l/6N05su2IFYxmMhbxGOCDuZ7ssL6hav05myUUjRgvceEtXSScm8/kokU5HLywIg=
X-Gm-Gg: AR+sD11AkQyQ8XskNdlUpQhSCeQJf9DZkWWF+fQXjJ/IFinCcfX1KmoGTlYCi+c0DpF
	kzQ+InP34I5evZB/9noKM5wGPejWp4rYf1Ro7THADe659N1ZNfp1gYC6PwJxBOPcZpWC4D/4e/n
	q0yljwo6n+w5LQxzetdQE+5NnKMJKnFs5hSt8QRUPUhDrrf13GsZ+UBhdjVGgL4/sr68TRADGzE
	GJE6B/Y1DXtFmnFzFYOOK+EGPe44R1OSseHME9qTkXqtGTUuTXjMlEWIa6vctLtHhfQPDlzHhhQ
	VWI3l1FI6KS1lgZGN7YKZijZnkYfp5ruac9Mjh2iZHuXetYauez5x4EvkA9ViWra9MQkzwU6SQ7
	491W6ws6p4chS+1jvNP5t+AYIboqeInltEITjdRMl843j4S1B0cifMj6L91cj6lDeR+56/TbelV
	jSLmH5XLQK6AP/Lg==
X-Received: by 2002:ac8:580e:0:b0:51c:bc76:dae0 with SMTP id d75a77b69052e-52b386a7ba7mr19638371cf.57.1785407810566;
        Thu, 30 Jul 2026 03:36:50 -0700 (PDT)
X-Received: by 2002:ac8:580e:0:b0:51c:bc76:dae0 with SMTP id d75a77b69052e-52b386a7ba7mr19638191cf.57.1785407810158;
        Thu, 30 Jul 2026 03:36:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db942d8dsm265582e87.13.2026.07.30.03.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:36:49 -0700 (PDT)
Date: Thu, 30 Jul 2026 13:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nilesh Javali <njavali@marvell.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, martin.petersen@oracle.com,
        GR-FC-Storage-Upstream@marvell.com, agurumurthy@marvell.com,
        emilne@redhat.com, jmeneghi@redhat.com, hare@suse.com
Subject: Re: [PATCH] qla2xxx: Add ql2900_fw.bin firmware for 29xx adapters
Message-ID: <vxgcmnhmkteubj53lmgm5opwdzksb754eswyfepcdpvv3vsnfj@dsccggwdqxvi>
References: <20260729092205.987221-1-njavali@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729092205.987221-1-njavali@marvell.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3OSBTYWx0ZWRfXylhju22hhF2z
 YEP2EP8DyuCWOwwddvWN/IV9WcsK6Ix3zOe2pKhjI1JaOCs1iymhMZDP/rysUvojdLPlrE6catJ
 jPBwen6OZyVW6Xmwh5sbWcg67hlc3IU=
X-Proofpoint-ORIG-GUID: clHRwnKjaMskA1PlfUkCPwuME9_4Cq3N
X-Authority-Analysis: v=2.4 cv=E7H9Y6dl c=1 sm=1 tr=0 ts=6a6b2943 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=rqVOtPskM135rwy09oYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3OSBTYWx0ZWRfXyr/yYx10nsT4
 B+3WOAPyEJ6dPfX0LByiB8iqJdoDGgAUFoNzhJ0mliI87+GAkxVgeLCw3DyT2S3ikni3UgitdWn
 LvpejFX962Jb1KoH1fzkqjaxPfc9ZIEBuJZ9MdUFfFWudwcg5lnWHcg/VauS59wkoPGxZXVrctu
 dRl05tZGiKLJZFFq6IbMNGqYmzBNjJ6Z1mFcldQFl6vfcpeQzsT/F158vLCn3tQ/N8Lc+dVEn+B
 7CIYcYqaI0lPgQHK0Dxuz0WUWluZjcepDhQkpYJgjey62P2urxKSsho32AYYopTF5kiFdnB1Ts8
 bq74RmSPBOFS2BIo+5ik9UmJZc/tStMW/m4r26e2tjmeK823Z8EyfB/r5Y+uuqgLwVmSILuuTSN
 oIIbMX9JOVVVvRLz1IODnKz6Ks36iMMHFx55213RZEyimTqyvSxFw3v89WgKs3A4ha9qAj3IaLO
 4lHYfsvJjYlqVPyVdDA==
X-Proofpoint-GUID: clHRwnKjaMskA1PlfUkCPwuME9_4Cq3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300079

On Wed, Jul 29, 2026 at 02:52:05PM +0530, Nilesh Javali wrote:
> Add operational firmware (ql2900_fw.bin, version 10.34.03) to
> support the Marvell/QLogic 29xx series Fibre Channel adapters via the
> qla2xxx driver. Covered by the existing LICENCE.qla2xxx redistribution
> terms.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1157

-- 
With best wishes
Dmitry
